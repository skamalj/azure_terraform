variable "rgname" {
    type = string
}

variable "vnet_name" {}

variable "nsg_name" {}

variable "key_vault_name" {
  
}

variable "dek_name" {}
variable "kek_name" {}

variable "vnet_address_space" {
  type = list(string)
}

variable "rule_list" {
  type = map
}
/*

*/
variable "subnet_props" {
  type = map(object({
    name = string
    address_prefixes = list(string)
  }))
}

variable "vm_list" {
  type = map
}

variable "des_name" {
  type = string 
}

variable "key_vault_roles" {
  type = list
  default = ["Key Vault Administrator"]
}

variable "tags" {
  type = map
  default = {
    project = "MSSQL On Azure VM"
  }
}
