terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm",
      version = ">= 2.78.0"
    }
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "aks_pool" {
    name = var.name
    kubernetes_cluster_id = var.kubernetes_cluster_id
    vm_size = var.vm_size
    
    enable_auto_scaling = var.enable_auto_scaling
    min_count = var.min_count
    max_count = var.max_count
    node_count = var.node_count

    enable_host_encryption = var.enable_host_encryption
    enable_node_public_ip = var.enable_node_public_ip
    fips_enabled = var.fips_enabled
    max_pods = var.max_pods
    mode = var.mode
    node_labels = var.node_labels
    orchestrator_version = var.orchestrator_version
    pod_subnet_id = var.pod_subnet_id
    os_type = var.os_type
    os_sku = var.os_type == "Linux" ? var.os_sku : null
    upgrade_settings {
      max_surge = var.max_surge
    }
    vnet_subnet_id = var.vnet_subnet_id
    zones = var.zones
    lifecycle {
    ignore_changes = [
      node_count
    ]
  }
}