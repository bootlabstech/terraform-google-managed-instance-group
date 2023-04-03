variable "instance_group_manager_name" {
    description = "instance_group_manager_name"
    type        =  string
    default = "test-managed-instance-group"
}
variable "base_instance_name" {
    description = "base_instance_name"
    type        =  string
    default = "appserver"
}
variable "zone" {
    description = "Zone of the MIG"
    type        =  string
     default = "asia-south1-a"
}
variable "target_size" {
    description = "Target size of the MIG"
    type        =  string
    default = "10"
}
variable "autoscaler_name" {
    description = "Name for the autoscaler"
    type        =  string
     default = "test-auto"
}
variable "max_replicas" {
    description = "Maximum number of replicas for the autoscaler"
    type        =  number
     default = 2
}
variable "min_replicas" {
    description = "Minimum number of replicas for the autoscaler"
    type        =  number
     default = 1
}
variable "cooldown_period" {
    description = "The cooldown period for the autoscaler"
    type        =  number
     default = 60
}
variable "metric_name" {
    description = "The metric name for the autoscaler"
    type        =  string
    default = "/"
}
variable "metric_filter" {
    description = "The metric filter for the autoscaler"
    type        =  string
    default = "/"
}
variable "single_instance_assignment" {
    description = "single_instance_assignment for the autoscaler"
    type        =  number
    default = 1
}
variable "project_id" {
    description = "project id of the MIG"
    type        =  string
     default = "mpaas-sandbox-965286"
}
variable "name" {
  type        = string
  description = "The name of the health check"
   default = "my-test-health-cheak-ss"
}
variable "request_path" {
  type        = string
  description = "The request path of the HTTP and HTTPS health check request"
  default     = "/"
}
variable "host" {
  type        = string
  description = "The value of the host header in the HTTP and HTTPS health check request"

   default = "80"
}
variable "enable_http_health_check" {
  type        = bool
  description = "Enable the HTTP health check to be used"
  default = false
}
variable "enable_https_health_check" {
  type        = bool
  description = "Enable the HTTPS health check to be used"
  default = false

}
variable "enable_tcp_health_check" {
    type=bool
    description = "enable the tcp health chek to use "
    default = true 
}
variable "instance_template_name_prefix" {
    description = "prfix for the instance template"
    type        =  string
     default = "test-instace-template"
}
variable "machine_type" {
    description = "machine type of the instances"
    type        =  string
     default = "e2-medium"
}
variable "region" {
    description = "region of the instance template"
    type        =  string
     default = "asia-south1"
}
variable "can_ip_forward" {
    description = "ip-forward configuration of the template"
    type        = bool
    default     = false

}
variable "auto_delete" {
    description = "auto-delete configuration of the template-disk"
    type        =  bool
    default     =  true
}
variable "boot" {
    description = "boot configuration of the template-disk"
    type        =  bool
    default     =  true
}
variable "network" {
    description = "network for the instance template"
    type        =  string
     default="demo-vpc"
}
variable "subnetwork" {
    description = "sub-network for the instance template"
    type        =  string
     default = "projects/mpaas-sandbox-965286/regions/asia-south1/subnetworks/demo-subnet"
}
variable "preemptible" {
    description = "Name of the disk"
    type        =  bool
     default = false
}
variable "automatic_restart" {
    description = "Name of the disk"
    type        =  bool
    default     =  true
}
variable "enable-guest-attributes" {
    description = "enable-guest-attributes config"
    type    =  bool
    default     =  true
}
variable "enable-osconfig" {
    description = "enable-osconfig"
    type    =  bool
    default     =  true
}
variable "template_source_image" {
    description = "Source image self_link for the instance template"
    type        =  string
    default = "projects/ubuntu-os-cloud/global/images/ubuntu-1804-bionic-arm64-v20230324"
}