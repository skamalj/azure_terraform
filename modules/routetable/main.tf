terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm",
      version = ">= 2.78.0"
    }
  }
}

resource "azurerm_route_table" "rt" {
    name                = var.name
    resource_group_name = var.resource_group_name
    location            = var.location
    disable_bgp_route_propagation = var.disable_bgp_route_propagation
    tags                = var.tags
}

resource "azurerm_route" "routes" {
    for_each =  var.routes
        name                = each.key
        resource_group_name = var.resource_group_name
        route_table_name    = azurerm_route_table.rt.name
        address_prefix      = each.value.address_prefix
        next_hop_type       = each.value.next_hop_type
        next_hop_in_ip_address = each.value.next_hop_type == "VirtualAppliance" ? each.value.next_hop_in_ip_address : null
}