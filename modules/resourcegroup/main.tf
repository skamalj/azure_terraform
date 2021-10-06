terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm",
      version = ">= 2.78.0"
    }
  }
}

resource "azurerm_resource_group" "rg" {
  name     =  var.name
  location =  var.location
  tags = try(var.tags, null) # Use if provided else ignore
}
