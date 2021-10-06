terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm",
      version = ">= 2.78.0"
    }
  }
}

resource "azurerm_subnet" "subnets" {
  for_each = var.subnet_props

  name = each.value.name 
  virtual_network_name = var.virtual_network_name
  resource_group_name = var.resource_group_name
  address_prefixes = each.value.address_prefixes
  service_endpoints = try(each.value.service_endpoints, null)
}
