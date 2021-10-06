output "server_ip" {
  value = [for k,v in  module.vms.vnet_interfaces : v.public_ips]
  description = "MSSQL Instance details"
}

output "disks" {
  value =  module.vms.managed_disks
  description = "Disk attached - This output show how you can use this for debugging"
}