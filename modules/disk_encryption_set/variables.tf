variable "resource_group_name" {
  type = string
}
variable "des_name" {
  type = string
  description = "Disk Encryption Set name"
}

variable "kek_name" {
  type = string
  description = "Key encryption key for which DES will be created"
}
variable "location" {
  type = string
}

variable "key_vault_name" {
  type = string
} 

variable "tags" {
  type = map
  default = {}
}
variable "key_vault_roles" {
  type = list
}
