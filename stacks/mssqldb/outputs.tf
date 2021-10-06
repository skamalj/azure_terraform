output "mssql_server" {
  value = { fqdn = module.mssql_server.mssql_server.fully_qualified_domain_name,  
          id = module.mssql_server.mssql_server.id}
  description = "MSSQL Server Object"
  sensitive = false
}