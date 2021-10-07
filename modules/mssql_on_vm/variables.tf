variable "virtual_machine_id" {}              
variable "sql_license_type" {
  default = "PAYG" # "AHUB"
}                
variable "r_services_enabled" {
  default = true
}              
variable "sql_connectivity_port" {
  default = 1433
}           
variable "sql_connectivity_type" {
  default = "PRIVATE"
}           
variable "sql_connectivity_update_password" {

} 
variable "sql_connectivity_update_username" {
  default = "sqllogin"
}
variable "disk_type" {
  default = "NEW"
}
variable "storage_workload_type" {
  default = "GENERAL" # "OLTP" or "DW"
}
variable "data_luns" {
  type = list
}
variable "data_file_path" {
  default = "F:\\data"
}
variable "log_luns" {
  type = list
}
variable "log_file_path" {
  default = "G:\\data"
}
variable "temp_luns" {
  type = list
}
variable "temp_file_path" {
  default = "H:\\data"
}
variable "retention_period_in_days" {
  default = 7
}
variable "storage_blob_endpoint" {
  default = null
}
variable "storage_account_access_key" {
  default = null
}
variable "patching_day_of_week" {
  default = "Saturday"
}
variable "maintenance_window_duration_in_minutes" {
  default = 60
}
variable "maintenance_window_starting_hour" {
  default = 2
}