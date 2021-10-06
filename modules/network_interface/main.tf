terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm",
      version = ">= 2.78.0"
    }
  }
}

data "azurerm_resource_group" "resource_group" {
  name = var.rg_name
}

data "azurerm_virtual_network" "vnet_data" {
  name                = var.network
  resource_group_name = data.azurerm_resource_group.resource_group.name
}

data "azurerm_network_security_group" "nsg" {
  name                = var.nsg_name
  resource_group_name = data.azurerm_resource_group.resource_group.name
}

// Unlike resourcegroup and network, there can be multiple subnets in a vnet.  So a map is used 
// to ensure that 'data' can be referred using subnet name rather than index. i.e 
// data.azurerm_subnet.subnets["subnet-1"] instead of data.azurerm_subnet.subnets[0]
data "azurerm_subnet" "subnets" {
  for_each = zipmap(data.azurerm_virtual_network.vnet_data.subnets,
  data.azurerm_virtual_network.vnet_data.subnets)
  name                 = each.value
  virtual_network_name = var.network
  resource_group_name  = data.azurerm_resource_group.resource_group.name
}

// There can be multiple interfaces in the list and for each VM and there can be multiple ipconfigs 
// for each interface. We generate a map to identify for which ipconfig of which interface,  public IP 
// is requested. Once IPs are reserved, these can be referred using VM name and ipconfig index
// for allocation.
locals {
  // First statememt creates objects
  ip_configs_temp = flatten([
    for k, v in var.interface_list : flatten([
      for i, configs in v.ipconfigs : { join("-", [var.name_prefix, k, i]
      ) = lookup(configs, "pip_props", null) } if configs.attach_public_ip
    ])
  ])
  //This statement changes object to map
  ip_configs = { for v in local.ip_configs_temp : keys(tomap(v))[0] => values(tomap(v))[0] }
}

module "public_ips" {
  for_each          = local.ip_configs
  source            = "../publicip"
  resource_group    = data.azurerm_resource_group.resource_group
  pip_name          = each.key
  allocation_method = lookup(each.value, "allocation_method", null)
  sku               = lookup(each.value, "sku", null)
  sku_tier          = lookup(each.value, "sku_tier", null)
  availability_zone = lookup(each.value, "availability_zone", null)
}

resource "azurerm_network_interface" "network_interfaces" {
  for_each             = var.interface_list
  name                 = join("-",[var.name_prefix,each.key])
  location             = data.azurerm_resource_group.resource_group.location
  resource_group_name  = data.azurerm_resource_group.resource_group.name
  enable_ip_forwarding = try(each.value.enable_ip_forwarding, null) # Use if value provided else ignore
  tags                 = try(each.value.tags, null)                 # Use if value provided else ignore

  dynamic "ip_configuration" {
    for_each = each.value.ipconfigs
    content {
      name = join("-", [each.key, ip_configuration.key])
      public_ip_address_id = try(module.public_ips[join("-",
                  [var.name_prefix, each.key, ip_configuration.key])].pip.id, null)
      subnet_id = data.azurerm_subnet.subnets[ip_configuration.value.subnet_name].id
      private_ip_address_allocation = lookup(ip_configuration.value, "private_ip",
                    "Dynamic") == "Dynamic" ? "Dynamic" : "Static"
      private_ip_address = lookup(ip_configuration.value, "private_ip", null)
      primary            = lookup(ip_configuration.value, "primary", false)
    }
  }
}

// All network interfaces get attched to same NSG. To attach different interface <-> NSG association
// call this module multiple times
resource "azurerm_network_interface_security_group_association" "nic_nsg_association" {
  for_each             = var.interface_list
  network_interface_id      = azurerm_network_interface.network_interfaces[each.key].id
  network_security_group_id = data.azurerm_network_security_group.nsg.id
}
