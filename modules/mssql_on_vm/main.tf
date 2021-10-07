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

resource "azurerm_mssql_virtual_machine" "mssql_on_vm" {
  virtual_machine_id               = var.virtual_machine_id              
  sql_license_type                 = var.sql_license_type                
  r_services_enabled               = var.r_services_enabled              
  sql_connectivity_port            = var.sql_connectivity_port           
  sql_connectivity_type            = var.sql_connectivity_type           
  sql_connectivity_update_password = var.sql_connectivity_update_password
  sql_connectivity_update_username = var.sql_connectivity_update_username
  
  storage_configuration {
    disk_type = var.disk_type
    storage_workload_type = var.storage_workload_type
    data_settings {
      luns = var.data_luns
      default_file_path = var.data_file_path 
    }
    log_settings {
      luns = var.log_luns
      default_file_path = var.log_file_path
   }
   temp_db_settings {
     luns = var.temp_luns
     default_file_path = var.temp_file_path
   }
  }
  dynamic "auto_backup" {
    for_each = var.storage_blob_endpoint == null ? [] : [1]
    content {
      retention_period_in_days = var.retention_period_in_days
      storage_blob_endpoint = var.storage_blob_endpoint
      storage_account_access_key = var.storage_account_access_key
    }
  }
  auto_patching {
    day_of_week                            = var.patching_day_of_week
    maintenance_window_duration_in_minutes = var.maintenance_window_duration_in_minutes
    maintenance_window_starting_hour       = var.maintenance_window_starting_hour
  }
}