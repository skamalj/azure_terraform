terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm",
      version = ">= 2.78.0"
    }
  }
}

data "azurerm_key_vault" "key_vault" {
  name                = var.key_vault_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_key_vault_key" "key_vault_key" {
  name            = var.name
  key_vault_id    = data.azurerm_key_vault.key_vault.id
  key_type        = var.key_type
  key_size        = var.key_size
  key_opts        = var.key_opts
  expiration_date = var.expiration_date
  tags            = var.tags
}
