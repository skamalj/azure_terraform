terraform {
  backend "azurerm" {
    resource_group_name = "myrg"
    // This is provided using terraform init -backend-config="key=value"
    storage_account_name = "myterraformaccount"
    use_microsoft_graph  = true
    container_name       = "tfstate"
    key                  = "dev.aks"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm",
      version = ">= 2.78.0"
    }
  }
}

provider "azurerm" {
  environment = "public"
  features {
    log_analytics_workspace {
      permanently_delete_on_destroy = true
    }
    key_vault {
      purge_soft_delete_on_destroy    = false
      recover_soft_deleted_key_vaults = true
    }
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}


module "rg" {
  source   = "../../modules/resourcegroup"
  name     = var.rgname
  location = "eastus"
}

module "vnet" {
  source              = "../../modules/vnet"
  resource_group_name = module.rg.resource_group.name
  location            = module.rg.resource_group.location
  name                = var.vnet_name
  address_space       = var.vnet_address_space
}

module "subnets" {
  source               = "../../modules/subnets"
  resource_group_name  = module.rg.resource_group.name
  virtual_network_name = module.vnet.vnet.name
  subnet_props         = var.subnet_props
}

resource "azurerm_log_analytics_workspace" "akslaws" {
  name                = "akslaws"
  resource_group_name = module.rg.resource_group.name
  location            = module.rg.resource_group.location
  sku                 = "PerGB2018"
  retention_in_days   = 30
}


module "aks-cluster" {
  source                                = "../../modules/aks"
  name                                  = "aksclusterterraform"
  network_plugin                        = var.network_plugin
  azure_policy_enabled                  = var.network_plugin == "kubenet" ? false : null
  pod_cidr                              = var.network_plugin == "kubenet" ? var.pod_cidr : null
  resource_group_name                   = module.rg.resource_group.name
  kubernetes_version                    = var.cluster_version
  private_cluster_enabled               = var.private_cluster_enabled
  log_analytics_workspace_id            = azurerm_log_analytics_workspace.akslaws.id
  node_pool_resource_group_name         = var.poolrgname
  api_server_authorized_ip_ranges       = split(",", var.api_server_authorized_ip_ranges)
  aks_admin_group_object_ids            = [var.aks_admin_group_object_ids]
  http_application_routing_enabled      = true
  create_ingress_application_gateway    = true
  ingress_application_gateway_name      = "aks-ingress-app-gateway"
  ingress_application_gateway_subnet_id = module.subnets.subnet["ingress-subnet"].id
  node_labels = {
    "pool" = "default"
  }
  pod_subnet_id   = var.network_plugin == "kubenet" || var.enable_windows_pool || var.disable_pod_subnet  ? null : module.subnets.subnet["pod-subnet"].id
  node_subnet_id  = module.subnets.subnet["node-subnet"].id
  aci_subnet_name = var.network_plugin == "kubenet" ? null : module.subnets.subnet["aci-aks-subnet"].name
  depends_on = [
    module.rg,
    azurerm_log_analytics_workspace.akslaws
  ]
}

module "aks-pool" {
  source                = "../../modules/aks-nodepool"
  name                  = "userpool"
  kubernetes_cluster_id = module.aks-cluster.aksid
  vnet_subnet_id        = module.subnets.subnet["node-subnet-user"].id
  orchestrator_version  = var.cluster_version
  pod_subnet_id         = var.network_plugin == "kubenet" || var.enable_windows_pool || var.disable_pod_subnet ? null : module.subnets.subnet["pod-subnet-user"].id
  node_labels = {
    "pool" = "linux"
  }
  depends_on = [
    module.rg,
    module.subnets,
    module.aks-cluster
  ]
}

module "aks-pool-2" {
  source                = "../../modules/aks-nodepool"
  name                  = "userpool2"
  kubernetes_cluster_id = module.aks-cluster.aksid
  vnet_subnet_id        = module.subnets.subnet["node-subnet-user"].id
  orchestrator_version  = var.cluster_version
  pod_subnet_id         = var.network_plugin == "kubenet" || var.enable_windows_pool || var.disable_pod_subnet ? null : module.subnets.subnet["pod-subnet-user"].id
  node_labels = {
    "pool" = "linux-2"
  }
  depends_on = [
    module.rg,
    module.subnets,
    module.aks-cluster
  ]
}

module "aks-pool-win" {
  count = var.enable_windows_pool ? 1 : 0
  source                = "../../modules/aks-nodepool"
  name                  = "win"
  kubernetes_cluster_id = module.aks-cluster.aksid
  vnet_subnet_id        = module.subnets.subnet["node-subnet-user"].id
  orchestrator_version  = var.cluster_version
  os_type = "Windows"
  vm_size = "Standard_D2s_v3"
  node_labels = {
    "pool" = "windows"
  }
  depends_on = [
    module.rg,
    module.subnets,
    module.aks-cluster
  ]
}

resource "azurerm_role_assignment" "aks-net-contributor" {
  scope                = module.vnet.vnet.id
  role_definition_name = "Contributor"
  principal_id         = module.aks-cluster.aks_principal.0.principal_id
}
