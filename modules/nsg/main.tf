terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm",
      version = ">= 2.78.0"
    }
  }
}


resource "azurerm_network_security_group" "nsg" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name

  dynamic "security_rule" {
    for_each = var.rule_list
    content {
      name                            = security_rule.key
      description                     = try(security_rule.value.description, "Open port 22 and 3389")
      priority                        = try(security_rule.value.priority, 100)
      direction                       = try(security_rule.value.direction, "Inbound")
      access                          = try(security_rule.value.access, "Allow")
      protocol                        = try(security_rule.value.protocol, "Tcp")
      source_port_ranges              = try(security_rule.value.source_port_ranges, null)
      source_port_range               = (try(security_rule.value.source_port_ranges, null) == null ? 
                                            try(security_rule.value.source_port_range, "*") : null)
      destination_port_range          = try(security_rule.value.destination_port_range, null)
      destination_port_ranges         = (try(security_rule.value.destination_port_range, null) == null ? 
                                            try(security_rule.value.destination_port_ranges, ["22", "3389"]) : null)
      source_address_prefixes         = try(security_rule.value.source_address_prefixes, null)
      source_address_prefix           = (try(security_rule.value.source_address_prefixes, null) == null ? 
                                            try(security_rule.value.source_address_prefix, "*") : null)
      destination_address_prefixes    = try(security_rule.value.destination_address_prefixes, null)
      destination_address_prefix      = (try(security_rule.value.destination_address_prefixes, null) == null ? 
                                            try(security_rule.value.destination_address_prefix, "*") : null)
    }
  }
  tags = var.tags
}
