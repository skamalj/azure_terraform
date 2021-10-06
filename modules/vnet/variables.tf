variable "name" {
    type = string
    description = "VNET name"
}

variable "location" {
    type = string
    description = "VNET location"
}

variable "resource_group_name" {
  description = "Resource group name"
}

variable "tags" {
  type = map
  default = {}
}

variable "address_space" {
  type = list(string)
  default = [ "10.0.0.0/8" ]
  description = "Address space for vnet - this is list of address ranges ['10.1.0.0/16','10.2.0.0/16']"
}