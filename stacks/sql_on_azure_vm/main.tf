terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm",
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
  }
}

module "vms" {
  source = "../../modules/vm"
  rg_name = var.rgname
  vm_list = var.vm_list
  network = var.vnet_name
  nsg_name = "sql_server_nsg"
}

#resource "azurerm_mssql_virtual_machine" "mssql" {
#  virtual_machine_id               = module.vms.vms["vm-1"].id
#  sql_license_type                 = "PAYG"
#  r_services_enabled               = true
#  sql_connectivity_port            = 1433
#  sql_connectivity_type            = "PRIVATE"
#  sql_connectivity_update_password = "Password1234!"
#  sql_connectivity_update_username = "sqllogin"
#  
#  storage_configuration {
#    disk_type = "NEW"
#    storage_workload_type = "OLTP"
#    data_settings {
#      luns = [10,11]
#      default_file_path = "F:\\data" 
#    }
#    log_settings {
#      luns = [12]
#      default_file_path = "G:\\logs"
#   }
#   temp_db_settings {
#     luns = [13]
#     default_file_path = "H:\\temp_db"
#   }
#  }
#  auto_patching {
#    day_of_week                            = "Sunday"
#    maintenance_window_duration_in_minutes = 60
#    maintenance_window_starting_hour       = 2
#  }
#}