output "vms" {
  value = azurerm_virtual_machine.vms
  description = "Returns whole list of VM created "
}

output "vnet_interfaces" {
  value = module.vnet_interfaces
  description = "List of interfaces created"
}

output "managed_disks" {
  value = local.disk_vm_map
  description = "List of interfaces created"
}