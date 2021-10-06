variable "resource_group_name" {
  type = string  
}

variable "disk_encryption_set_name" {
  default = null
  type = string
}

variable "key_vault_name" {
  default = null
  type = string
}

variable "dek_name" {
  type = string
  default = null
  description = "Data encryption key name"
} 
variable "kek_name" {
  type = string
  default  = null
  description = "Key encryption key name"
}
/*
{
each.value.disk_name
lookup(each.value, "storage_account_type", "Standard_LRS")
lookup(each.value, "create_option", "Empty")
each.value.source_resource_id , If create option is "Copy" or "Restore"
each.value.image_reference_id, If create option is "FromImage"
lookup(each.value, "disk_size_gb", 50)
}
*/
variable "disk_props" {
  default = []
}

variable "name_prefix" {
  type = string
}

variable "tags" {
  default  = {}
}