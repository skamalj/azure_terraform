variable "resource_group" {
  
}
variable "pip_name" {
  description = "Public IP address name"
}
variable "tags" {
  type = map
  default = {}
  description = "Tags on resource"
}

variable "allocation_method" {
  type = string
  default = "Static"
  description = "Choose allocation method - Static or Dynamic"
}

variable "sku" {
  type = string
  default = "Standard"
  description = "Provide sku value which can be Standard or Basic"
}

variable "sku_tier" {
  type = string
  default = "Regional"
  description = "Provide sku_tier value which can be Regional or Global"
}

variable "availability_zone" {
  type = string
  default = "No-Zone"
  description = "Provide this only with Standard sku. Other values are Zone-Reduntant or 1,2,3"
}
