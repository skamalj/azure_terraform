output "mssql_server" {
  value = azurerm_mssql_virtual_machine.mssql_on_vm.id
  description = "MSSQL Server On VM ID"
}
