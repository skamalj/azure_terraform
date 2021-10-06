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

data "azurerm_key_vault" "key_vault" {
  count               = try(var.key_vault_name, null) != null ? 1 : 0
  name = var.key_vault_name
  resource_group_name = var.resource_group_name
}

data "azurerm_disk_encryption_set" "des" {
  count               = try(var.disk_encryption_set_name, null) != null ? 1 : 0
  name                = var.disk_encryption_set_name
  resource_group_name = var.resource_group_name
}

data "azurerm_key_vault_key" "dek" {
  count        = try(var.dek_name, null) != null ? 1 : 0
  name         = var.dek_name
  key_vault_id = data.azurerm_key_vault.key_vault[0].id
}

data "azurerm_key_vault_key" "kek" {
  count        = try(var.kek_name, null) != null ? 1 : 0
  name         = var.kek_name
  key_vault_id = data.azurerm_key_vault.key_vault[0].id
}

resource "azurerm_managed_disk" "disks" {
  for_each               = {for v in var.disk_props: v.disk_name => v}
  name                   = join("-",[var.name_prefix,each.value.disk_name])
  location               = data.azurerm_resource_group.resource_group.location
  resource_group_name    = data.azurerm_resource_group.resource_group.name
  storage_account_type   = lookup(each.value, "storage_account_type", "Standard_LRS")
  create_option          = lookup(each.value, "create_option", "Empty")
  source_resource_id     = (lookup(each.value, "create_option", "Empty") == "Copy" ||
                            lookup(each.value, "create_option", "Empty") == "Restore" ?
                            each.value.source_resource_id : null)
  image_reference_id     = (lookup(each.value, "create_option", "Empty") == "FromImage" ?
                            each.value.image_reference_id : null)
  disk_size_gb           = lookup(each.value, "disk_size_gb", 50)
  disk_encryption_set_id = try(data.azurerm_disk_encryption_set.des[0].id, null)
  dynamic "encryption_settings" {
    for_each = try(data.azurerm_disk_encryption_set.des[0].id, null) != null ? [1] : []
    content {
        enabled = true
        disk_encryption_key {
          secret_url      = data.azurerm_key_vault_key.dek[0].id
          source_vault_id = data.azurerm_key_vault.key_vault[0].id
        }
        key_encryption_key {
          key_url      = data.azurerm_key_vault_key.kek[0].id
          source_vault_id = data.azurerm_key_vault.key_vault[0].id
        }
    }
  }

  tags = var.tags
}
