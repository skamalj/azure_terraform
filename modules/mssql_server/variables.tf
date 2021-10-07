variable "sp_display_name" {
  default = null
  type = string
}  

variable "user_principal_name" {
  default = null
  type = string
}

variable "resource_group_name" {
  type = string
}           

variable "storage_account_name" {
  type = string
  default = null
}    
variable "server_name" {
  type = string
}
variable "mssql_version" {
  type = string
}
variable "administrator_login" {
  type = string
}
variable "administrator_password" {
  type = string
}
variable "minimum_tls_version" {
  type = string
  default = "1.2"
}
variable "use_secondary_key" {
  type = bool
  default = false
}
variable "retention_days" {
  type = number
  default = 7
}
variable "log_monitoring_enabled" {
  type = bool
  default = true
}

variable "connection_policy" {
  default = "Default" 
}
variable "tags" {
  type = map
  default = {}
}