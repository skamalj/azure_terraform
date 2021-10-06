output "pip" {
  value = azurerm_public_ip.pip
  description = "Returns PIP object.  Access address as pip.ip_address"
}