output "vms" {
  value = azurerm_virtual_machine.vms
  description = "Returns whole list of VM created "
  depends_on = [
    azurerm_virtual_machine_data_disk_attachment.vm_disk_attach
  ]
}

output "vnet_interfaces" {
  value = module.vnet_interfaces
  description = "List of interfaces created"
}

output "managed_disks" {
  value = local.disk_vm_map
  description = "List of interfaces created"
}