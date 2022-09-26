variable "project_id" {
    description = "project id of the MIG"
    type        =  string
}
variable "instance_template_name_prefix" {
    description = "prfix for the instance template"
    type        =  string
}
variable "machine_type" {
    description = "machine type of the instances"
    type        =  string
}
variable "region" {
    description = "region of the instance template"
    type        =  string
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
}
variable "subnetwork" {
    description = "sub-network for the instance template"
    type        =  string
}
variable "preemptible" {
    description = "Name of the disk"
    type        =  bool
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
variable "instance_group_manager_name" {
    description = "instance_group_manager_name"
    type        =  string
}
variable "base_instance_name" {
    description = "base_instance_name"
    type        =  string
}
variable "zone" {
    description = "Zone of the MIG"
    type        =  string
}
variable "target_size" {
    description = "Target size of the MIG"
    type        =  string
}
variable "template_source_image" {
    description = "Source image self_link for the instance template"
    type        =  string
}
variable "autoscaler_name" {
    description = "Name for the autoscaler"
    type        =  string
}
variable "max_replicas" {
    description = "Maximum number of replicas for the autoscaler"
    type        =  number
}
variable "min_replicas" {
    description = "Minimum number of replicas for the autoscaler"
    type        =  number
}
variable "cooldown_period" {
    description = "The cooldown period for the autoscaler"
    type        =  number
}
variable "metric_name" {
    description = "The metric name for the autoscaler"
    type        =  string
}
variable "metric_filter" {
    description = "The metric filter for the autoscaler"
    type        =  string
}
variable "single_instance_assignment" {
    description = "single_instance_assignment for the autoscaler"
    type        =  number
}