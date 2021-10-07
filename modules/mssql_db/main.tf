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
locals {
  is_serverless = length(regexall("Gen5", var.sku_name)) > 0
}
resource "azurerm_mssql_database" "mssql_db" {
    name = var.db_name
    server_id = var.server_id
    auto_pause_delay_in_minutes = var.auto_pause_delay_in_minutes
    create_mode = var.create_mode
    elastic_pool_id = var.elastic_pool_id
    geo_backup_enabled = var.geo_backup_enabled #Only for DW SKUs, else ignored
    license_type = local.is_serverless ? null : var.license_type
    read_replica_count = var.read_replica_count  // Only for hyperscale
    dynamic "short_term_retention_policy" {
        for_each = try(var.retention_days,null) == null ? [] : [1]
        content {
            retention_days = var.retention_days
        }
    }
    dynamic "long_term_retention_policy" {
        for_each = try(var.ltr , null) == null ? [] : [1]
        content {
            weekly_retention = lookup(var.ltr,"week",0)
            monthly_retention = lookup(var.ltr,"month",0)
            yearly_retention = lookup(var.ltr,"month",0)
            week_of_year = lookup(var.ltr,"month",0)
        }
    }
    storage_account_type = var.storage_account_type
    zone_redundant = var.zone_redundant
    max_size_gb = var.max_size_gb
    // https://docs.microsoft.com/en-us/azure/azure-sql/database/resource-limits-vcore-single-databases
    sku_name = var.sku_name
    tags = var.tags 
}

resource "azurerm_mssql_database" "mssql_db_replica" {
    for_each = { for v in range(var.read_replica_count): v => v}
    name = join("-",[var.db_name,each.value])
    server_id = var.server_id
    create_mode = "Secondary"
    creation_source_database_id = azurerm_mssql_database.mssql_db.id
}