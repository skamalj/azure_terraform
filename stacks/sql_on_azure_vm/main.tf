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

module "mssql_on_vm" {
  source = "../../modules/mssql_on_vm"

  virtual_machine_id = module.vms.vms["vm-1"].id
  sql_connectivity_update_password = var.sql_connectivity_update_password
  data_luns = var.data_luns
  log_luns = var.log_luns
  temp_luns = var.temp_luns
}