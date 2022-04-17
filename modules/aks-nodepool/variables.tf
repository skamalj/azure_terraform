variable "name" { 
}
variable "kubernetes_cluster_id" { 
}
variable "vnet_subnet_id" {
}
variable "orchestrator_version"  {
}
variable "pod_subnet_id" {
    default = null
}

variable "vm_size" {
    default = "Standard_D2_v2"
   # default = "Standard_D2ds_v4"
}
variable "enable_auto_scaling" {
    default = true
}
variable "min_count" {
    default = 1
}
variable "max_count" {
    default = 5
}
variable "node_count" {
    default = 1
}
variable "enable_host_encryption" {
    default = false
}
variable "enable_node_public_ip" {
    default = false
}
variable "fips_enabled" {
    default = false
}
variable "max_pods" {
    default = 30
}
variable "mode" {
    default = "User"
}
variable "node_labels" {
    default = null
}
variable "os_type" {
    default = "Linux"
}
variable "os_sku" {
    default = "Ubuntu"
}
variable "max_surge" {
    default = "1"
}
variable "zones" {
  default = [1,2]
}
