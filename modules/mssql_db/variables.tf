variable "db_name" {

}
variable "server_id" {
  
}
variable "sku_name" {
  default = "BC_Gen5_2"
}
variable "max_size_gb" {
  default = 100
}
variable "auto_pause_delay_in_minutes" {
  default = 60
}
variable "create_mode" {
  default = "Default"
}
variable "elastic_pool_id" {
  default = null
}
variable "geo_backup_enabled" {
 default = true 
}
variable "license_type" {
  default = "BasePrice"
}
variable "read_replica_count" {
    default = 2 
}
variable "retention_days" {
    default = null
}
variable "ltr" {
    default = null
}
variable "storage_account_type" {
    default = "ZRS"
}
variable "zone_redundant" {
  default = false
}
variable "tags" {
  default = {}
}
