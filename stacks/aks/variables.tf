variable "rgname" {
    type = string
}
variable "poolrgname" {
    type = string
}

variable "vnet_name" {}

variable "vnet_address_space" {
  type = list(string)
}

variable "subnet_props" {
  type = map
}
