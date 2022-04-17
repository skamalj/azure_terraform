variable "rgname" {
}
variable "poolrgname" {
}
variable "vnet_name" {
}
variable "vnet_address_space" {
  type = list(string)
}
variable "subnet_props" {
  type = map
}
variable "aks_admin_group_object_ids" {
}
variable "cluster_version" {
  default = "1.22.6"
}
variable "api_server_authorized_ip_ranges" {
  default = "223.181.146.8/32"
}
variable "network_plugin" {
  default = "azure"
}
variable "pod_cidr" {
  default = "192.168.0.0/16" 
}
variable enable_windows_pool {
  default = false
}
variable "disable_pod_subnet" {
  default = false
}
variable "private_cluster_enabled" {
  default = false
}
