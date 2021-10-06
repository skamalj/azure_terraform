output "disks" {
  value = azurerm_managed_disk.disks
  description = "List of disk Object, mapped to VM name"
}