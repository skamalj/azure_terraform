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

provider "azuread" {
  environment = "public"
}

module "mssql_server" {
  source = "../../modules/mssql_server"
  
  resource_group_name = var.resource_group_name
  server_name = var.server_name
  mssql_version = var.mssql_version
  administrator_login = var.administrator_login
  administrator_password = var.administrator_password
  sp_display_name = var.sp_display_name
  user_principal_name = var.user_principal_name
}

module "mssql_db" {
  source = "../../modules/mssql_db"

  db_name = var.db_name
  server_id = module.mssql_server.mssql_server.id
  zone_redundant = true
}
