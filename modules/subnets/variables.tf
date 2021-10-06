variable "resource_group_name" {
  type = string
  description = "Resource group name"
}
variable "virtual_network_name" {
    type = string
    description = "VNET name"
}
/*
// Example input for subnet properties is shown below.  
// service endpoints field is optional
subnet_props = {
    "subnet-1" = {
        name = "subnet-1"
        address_prefixes = ["10.1.1.0/24"]
        service_endpoints = ["Microsoft.Sql","Microsoft.Storage"]
        }
    "subnet-2" = {
        name = "subnet-2"
        address_prefixes = ["10.2.1.0/24"]
        service_endpoints = ["Microsoft.Sql","Microsoft.Storage"]
        }    
}
*/
variable "subnet_props" {
  type = map
  description = "Provide subnet properties, see example"
}