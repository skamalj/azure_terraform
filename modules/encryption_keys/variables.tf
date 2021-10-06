variable "resource_group_name" {
  type = string
}
variable "name" {
  type = string
  description = "Key name"
}

variable "key_vault_name" {
  type = string
}

variable "key_type" {
  type = string
  default = "RSA"
} 
variable "key_size" {
  type = string
  default = 2048
}

variable "key_opts" {
  type = list
  default = ["decrypt", "encrypt", "sign", "unwrapKey", "verify","wrapKey" ]
}
variable "expiration_date" {
  type = string
  default  = null
}

variable "tags" {
  type = map
  default = {}
}