terraform {
  backend "azurerm" {
    resource_group_name  = "myrg"
    // This is provided using terraform init -backend-config="key=value"
    storage_account_name = "myterraformaccount"
    use_microsoft_graph = true
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
     purge_soft_delete_on_destroy = false 
     recover_soft_deleted_key_vaults = true
    }
  }
}


module "rg" {
  source = "../../modules/resourcegroup"
  name   = var.rgname
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
  source               = "../../modules/aks"
  name                 = "aksclusterterraform"
  resource_group_name  = module.rg.resource_group.name
  win_admin_username       = "abc123"
  win_admin_password       = "P@ssw0rd"
  log_analytics_workspace_id = azurerm_log_analytics_workspace.akslaws.id
  node_pool_resource_group_name = var.poolrgname
  pod_subnet_id = module.subnets.subnet["pod-subnet"].id
  node_subnet_id        = module.subnets.subnet["node-subnet"].id
  depends_on = [
    module.rg,
  ]
}
