terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm",
      version = ">= 2.78.0"
    }
  }
}

data "azurerm_resource_group" "resource_group" {
  name = var.resource_group_name
}

data azurerm_client_config "current" {}

resource "azurerm_key_vault" "key_vault" {
  name                            = var.key_vault_name
  location                        = data.azurerm_resource_group.resource_group.location
  resource_group_name             = data.azurerm_resource_group.resource_group.name
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_template_deployment = var.enabled_for_template_deployment
  enable_rbac_authorization       = var.enable_rbac_authorization
  tenant_id                       = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days      = var.soft_delete_retention_days
  purge_protection_enabled        = var.purge_protection_enabled
  sku_name                        = var.sku_name
}
