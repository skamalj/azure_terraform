variable "name" {
    type = string
    description = "Resource group name"
}

variable "location" {
  type = string  
  default = "Central India"
  description = "Resource group location"
}

variable "tags" {
  type = map
  default = {}
  description = "Tags on resource group"
}