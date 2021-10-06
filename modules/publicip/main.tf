terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm",
      version = ">= 2.78.0"
    }
  }
}

// Those null conditions are due to bug/feature not working as expected - 
// https://github.com/hashicorp/terraform/issues/24142
resource "azurerm_public_ip" "pip" {
  name                = var.pip_name
  resource_group_name = var.resource_group.name
  location            = var.resource_group.location
  allocation_method   = var.allocation_method == null ? "Static" : var.allocation_method
  sku                 = var.sku == null ? "Standard" : var.sku
  sku_tier            = var.sku_tier == null ? "Regional" : var.sku_tier
  tags                = var.tags
  availability_zone   = var.availability_zone == null ? "No-Zone" : var.availability_zone
}
