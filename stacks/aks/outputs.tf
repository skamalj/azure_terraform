output "aks_principal" {
  value = module.aks-cluster.aks_principal.0.principal_id
}
output "vnet_id" {
  value = module.vnet.vnet.id
}
output "aks-fqdn" {
  value = module.aks-cluster.aksfqdn
}
