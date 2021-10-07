terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm",
      version = ">= 2.78.0"
    }
    azuread = {
      source = "hashicorp/azuread"
      version = "2.5.0"
    }
  }
}

data "azurerm_client_config" "current" {
}

data "azuread_service_principal" "service_principal" {
  count = var.sp_display_name == null ? 0 : 1
  display_name = var.sp_display_name
}

data "azuread_user" "user_principal" {
  count = var.user_principal_name == null ? 0 : 1
  user_principal_name = var.user_principal_name
}

data "azurerm_resource_group" "resource_group" {
  name = var.resource_group_name
}

data "azurerm_storage_account" "audit_storage_account" {
  count = var.storage_account_name == null ? 0 : 1
  name                = var.storage_account_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_mssql_server" "mssql_server" {
  name                         = var.server_name
  resource_group_name          = data.azurerm_resource_group.resource_group.name
  location                     = data.azurerm_resource_group.resource_group.location
  version                      = var.mssql_version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_password
  minimum_tls_version          = var.minimum_tls_version
  connection_policy            = var.connection_policy

  dynamic "azuread_administrator" {
    for_each = try(data.azuread_service_principal.service_principal[0].object_id, 
                        data.azuread_user.user_principal[0].id,null) == null ? [] : [1]
    content {
      login_username = var.user_principal_name == null ? var.sp_display_name : var.user_principal_name
      object_id      = try(data.azuread_service_principal.service_principal[0].object_id, 
                        data.azuread_user.user_principal[0].id)
      tenant_id      = data.azurerm_client_config.current.tenant_id
    }
  }

  dynamic "extended_auditing_policy" {
    for_each = var.storage_account_name == null ? [] : [1]
    content {
      storage_endpoint                        = data.azurerm_storage_account.audit_storage_account.primary_blob_endpoint
      storage_account_access_key              = ( var.use_secondary_key ? 
                                                  data.azurerm_storage_account.audit_storage_account.primary_access_key :
                                                  data.azurerm_storage_account.audit_storage_account.secondary_access_key)
      storage_account_access_key_is_secondary = var.use_secondary_key
      retention_in_days                       = var.retention_days
      log_monitoring_enabled                  = var.log_monitoring_enabled
    }
  }

  tags = var.tags
}