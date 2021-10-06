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

data "azurerm_key_vault_key" "kek" {
  name         = var.kek_name
  key_vault_id = data.azurerm_key_vault.key_vault.id
}

resource "azurerm_disk_encryption_set" "des" {
  name                = var.des_name
  resource_group_name = var.resource_group_name
  location            = var.location
  key_vault_key_id    = data.azurerm_key_vault_key.kek.id
  tags                = var.tags
  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_role_assignment" "des_identity_role" {
  for_each             = toset(var.key_vault_roles)
  scope                = data.azurerm_key_vault.key_vault.id
  role_definition_name = each.value
  principal_id         = azurerm_disk_encryption_set.des.identity[0].principal_id
}
