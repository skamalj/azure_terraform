terraform {
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
  tags   = var.tags
}

module "vnet" {
  source              = "../../modules/vnet"
  resource_group_name = module.rg.resource_group.name
  location            = module.rg.resource_group.location
  name                = var.vnet_name
  tags                = var.tags
  address_space       = var.vnet_address_space
}

module "subnet" {
  source               = "../../modules/subnets"
  resource_group_name  = module.rg.resource_group.name
  virtual_network_name = module.vnet.vnet.name
  subnet_props         = var.subnet_props
}

module "nsg" {
  source              = "../../modules/nsg"
  resource_group_name = module.rg.resource_group.name
  name                = var.nsg_name
  location            = module.rg.resource_group.location
  rule_list           = var.rule_list
}

module "keyvault" {
  source              = "../../modules/keyvault"
  key_vault_name      = var.key_vault_name
  resource_group_name = module.rg.resource_group.name
  purge_protection_enabled = true
  depends_on = [
    module.rg
  ]
}

module "disk_encryption_key" {
  source              = "../../modules/encryption_keys"
  name                = var.dek_name
  key_vault_name      = module.keyvault.keyvault.name
  resource_group_name = module.rg.resource_group.name
  depends_on = [
    module.keyvault
  ]
}

module "key_encryption_key" {
  source              = "../../modules/encryption_keys"
  name                = var.kek_name
  key_vault_name      = module.keyvault.keyvault.name
  resource_group_name = module.rg.resource_group.name
  depends_on = [
    module.keyvault
  ]
}

module "des" {
  source              = "../../modules/disk_encryption_set"
  des_name            = var.des_name
  resource_group_name = module.rg.resource_group.name
  location            = module.rg.resource_group.location
  key_vault_name      = module.keyvault.keyvault.name
  key_vault_roles     = var.key_vault_roles
  kek_name            = var.kek_name
  depends_on = [
    module.keyvault,
    module.key_encryption_key
  ]
  tags = var.tags
}
