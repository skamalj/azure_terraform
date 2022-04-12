variable "name" {
}
variable "resource_group_name" {
}
variable "node_pool_resource_group_name" {
}
variable "pod_subnet_id" {
}
variable "node_subnet_id" {
}
variable "automatic_channel_upgrade" {
    default = "stable"
}
variable "api_server_authorized_ip_ranges" {
    default = ["171.79.37.62/32", "10.11.0.0/16"]
}
variable "aks_admin_group_object_ids" {
    default = ["your-group-object-id"]
}
variable "azure_policy_enabled" {
  default = true
}
variable "disk_encryption_set_id" {
  default = null
}
variable "http_application_routing_enabled" {
  default = true
}
variable "secret_rotation_interval" {
  default = "6m"
}
variable "kubernetes_version" {
    default = "1.22.6"
}
variable "maintenance_window_day" {
    default = "Sunday"
}
variable "maintenance_window_hours" {
    default = ["21","23"]
}
variable "service_cidr" {
  default = "172.16.0.0/16"
}
variable "open_service_mesh_enabled" {
  default = false
}
variable "private_cluster_enabled" {
  default = false
}
variable "public_network_access_enabled" {
  default = true
}
variable "role_based_access_control_enabled" {
  default = true
}
variable "default_node_pool_name" {
    default = "defaultpool"
}
variable "vm_size" {
    default = "Standard_D2_v2"
   # default = "Standard_D2ds_v4"
}
variable "max_pods" {
    default = 30
}
variable "max_count" {
    default = 5
}
variable "min_count" {
    default = 1  
}
variable "node_count" {
    default = 2
}
variable "fips_enabled" {
    default = false
}
variable "enable_node_public_ip" {
    default = false
}
variable "node_labels" {
    default = null
}
variable "pool_max_surge_for_upgrade" {
  default = "1"
}
variable "admin_username" {
    default = null
}
variable "ssh_key_data" {
    default = null
}
variable "oidc_issuer_enabled" {
  default = true
}
variable "win_admin_username" {
    default = null
}
variable "win_admin_password" {
    default = false
}
variable "network_plugin" {
    default = "azure"
}
variable "outbound_type" {
    default = "loadBalancer"
}
variable "log_analytics_workspace_id" {
    default = null
}
