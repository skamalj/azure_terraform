output "vnet_interfaces" {
  value = azurerm_network_interface.network_interfaces
  description = "Returns network interface objects in a list for a VM"
}

output "public_ips" {
  value = {for k,v in module.public_ips : v.pip.name => v.pip.ip_address}
}
