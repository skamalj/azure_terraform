variable "name" {
  
}
variable "resource_group_name" {
  
}
variable "location" {
  
}
variable "disable_bgp_route_propagation" {
    default = null
}
variable "tags" {
    default = null
}
variable "routes" {
  type = map
}
