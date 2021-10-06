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

locals {
  vm_disk_objects = flatten([for k, v in module.vm_disks: [for k1, v1 in v.disks: {join("",[v1.name]) = v1.id } ]])
  // Below statement converts list of objects to map
  disk_vm_map = {for v in local.vm_disk_objects : keys(v)[0] => values(v)[0] }

  // Create list of keys to refer to above local map for disk IDs.  We cannot refer above object directly in module
  vm_disk_ref_objects = flatten([for k, v in var.vm_list: [for v1 in v.storage_disks: { join("-",[k,v1.disk_name]) = k }]] )    
  //Convert list of objects to map
  vm_disk_ref_map = {for v in local.vm_disk_ref_objects : keys(v)[0] => values(v)[0] }
  
  lun_ids = [for v in local.vm_disk_objects : keys(v)[0]]            
}

module "vnet_interfaces" {
  for_each        = { for vm, config in var.vm_list : vm => config.network_interfaces }
  source          = "../network_interface"
  rg_name         = var.rg_name
  interface_list  = each.value
  network         = var.network
  name_prefix = each.key
  nsg_name        = var.nsg_name
}

module "vm_disks" {
  for_each =  var.vm_list
  source = "../managed_disks"

  resource_group_name = var.rg_name
  key_vault_name = lookup(each.value,"key_vault_name",null)
  dek_name = lookup(each.value,"dek_name",null)
  kek_name = lookup(each.value,"kek_name",null)
  disk_props = each.value.storage_disks
  name_prefix = each.key
}
resource "azurerm_virtual_machine" "vms" {
  for_each = var.vm_list

  name                         = each.key
  location                     = data.azurerm_resource_group.resource_group.location
  resource_group_name          = data.azurerm_resource_group.resource_group.name

  network_interface_ids        = [for k, v in module.vnet_interfaces[each.key].vnet_interfaces : v.id]
  primary_network_interface_id = [for k, v in module.vnet_interfaces[each.key].vnet_interfaces : v.id][0]

  vm_size = each.value.vmsize
  storage_os_disk {
    name              = join("-",[each.key,lookup(each.value, "os_disk_name","OSDisk")])
    caching           = lookup(each.value, "os_disk_caching","ReadWrite")
    create_option     = lookup(each.value, "os_disk_create_option","FromImage")
    managed_disk_type = lookup(each.value, "os_disk_type", "Standard_LRS")
  }
  storage_image_reference {
    publisher = each.value.os_image_publisher
    offer     = each.value.os_image_offer
    sku       = each.value.os_image_sku
    version   = each.value.os_image_version
  }
  os_profile {
    computer_name  = each.key
    admin_username = each.value.admin_username
    admin_password = lookup(each.value, "admin_password", null)
  }
  dynamic "os_profile_linux_config" {
    for_each = contains([for k, v in each.value : k], "admin_password") ? [] : ["create"]
    content {
      disable_password_authentication = true
      ssh_keys {
        key_data = file(each.value.key_file_path)
        path     = "/home/${lookup(each.value, "admin_username", null)}/.ssh/authorized_keys"
      }
    }
  }
  dynamic "os_profile_windows_config" {
    for_each = contains([for k, v in each.value : k], "admin_password") ? ["create"] : []
    content {
      provision_vm_agent = true
    }
  }
  availability_set_id              = ""
  delete_os_disk_on_termination    = lookup(each.value,"delete_os_disk_on_termination",true)
  delete_data_disks_on_termination = lookup(each.value,"delete_data_disks_on_termination",true)
  identity {
    type = "SystemAssigned"
  }
  tags = lookup(each.value,"tags",{})
}

resource "azurerm_virtual_machine_data_disk_attachment" "vm_disk_attach" {
  for_each = local.vm_disk_ref_map

  managed_disk_id    = local.disk_vm_map[each.key]
  virtual_machine_id = azurerm_virtual_machine.vms[each.value].id
  lun                = 10 + index(local.lun_ids,each.key)
  caching            = "ReadWrite"
  depends_on = [
    module.vm_disks
  ]
}