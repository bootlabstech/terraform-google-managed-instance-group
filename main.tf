resource "google_compute_instance_template" "instance_template" {
  project        = var.project_id
  name_prefix    = var.instance_template_name_prefix
  machine_type   = var.machine_type
  region         = var.region
  can_ip_forward = var.can_ip_forward

  // boot disk
  disk {
    source_image = var.template_source_image
    auto_delete  = var.auto_delete
    boot         = var.boot
  }

  // networking
  network_interface {
    network = var.network
    subnetwork = var.subnetwork
  }
  scheduling {
    preemptible       = var.preemptible
    automatic_restart = var.automatic_restart
  }
  metadata = {
    gce-software-declaration = <<-EOF
    {
      "softwareRecipes": [{
        "name": "install-gce-service-proxy-agent",
        "desired_state": "INSTALLED",
        "installSteps": [{
          "scriptRun": {
            "script": "#! /bin/bash\nZONE=$(curl --silent http://metadata.google.internal/computeMetadata/v1/instance/zone -H Metadata-Flavor:Google | cut -d/ -f4 )\nexport SERVICE_PROXY_AGENT_DIRECTORY=$(mktemp -d)\nsudo gsutil cp   gs://gce-service-proxy-"$ZONE"/service-proxy-agent/releases/service-proxy-agent-0.2.tgz   "$SERVICE_PROXY_AGENT_DIRECTORY"   || sudo gsutil cp     gs://gce-service-proxy/service-proxy-agent/releases/service-proxy-agent-0.2.tgz     "$SERVICE_PROXY_AGENT_DIRECTORY"\nsudo tar -xzf "$SERVICE_PROXY_AGENT_DIRECTORY"/service-proxy-agent-0.2.tgz -C "$SERVICE_PROXY_AGENT_DIRECTORY"\n"$SERVICE_PROXY_AGENT_DIRECTORY"/service-proxy-agent/service-proxy-agent-bootstrap.sh"
          }
        }]
      }]
    }
    EOF
    enable-guest-attributes  = var.enable-guest-attributes
    enable-osconfig          = var.enable-osconfig

  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "google_compute_instance_group_manager" "instance_group_manager" {
  project = var.project_id
  name    = var.instance_group_manager_name
  version {
    instance_template = google_compute_instance_template.instance_template.id
  }
  base_instance_name = var.base_instance_name
  zone               = var.zone
  target_size        = var.target_size

}
resource "google_compute_autoscaler" "default" {
  provider = google-beta
  project = var.project_id
  name   = var.autoscaler_name
  zone   = var.zone
  target = google_compute_instance_group_manager.instance_group_manager.id

  autoscaling_policy {
    max_replicas    = var.max_replicas
    min_replicas    = var.min_replicas
    cooldown_period = var.cooldown_period

    metric {
      name                       = var.metric_name
      filter                     = var.metric_filter
      single_instance_assignment = var.single_instance_assignment
      }
  }
}

