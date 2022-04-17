output "aksid" {
  value = azurerm_kubernetes_cluster.aks.id
  description = "AKS Cluster ID"
}
output "aksfqdn" {
  value = azurerm_kubernetes_cluster.aks.fqdn
  description = "AKS Cluster ID"
}
output "aks_principal" {
  value = azurerm_kubernetes_cluster.aks.identity
}