/* These are the options which you can specify for VMs

## Options without "lookup" are mandatory (except password)##

## admin_password if specified, instance is treated as Windows otherwise 
it is configured for Linux. Fir Linux instances SSH keys must be specified

lookup(each.value, "os_disk_name","OSDisk")
lookup(each.value, "os_disk_caching","ReadWrite")
lookup(each.value, "os_disk_create_option","FromImage")
lookup(each.value, "os_disk_type", "Standard_LRS")
lookup(each.value,"delete_data_disks_on_termination",true)
lookup(each.value, "admin_password", null) // Important -- Read above
lookup(each.value,"delete_data_disks_on_termination",true)
lookup(each.value,"delete_os_disk_on_termination",true)
lookup(storage_data_disk.value,"tags",{})

each.value.os_image_publisher
each.value.os_image_offer   
each.value.os_image_sk
each.value.os_image_version
each.value.admin_username
lookup(each.value, "admin_password", null)
each.value.key_file_path // This is checked is admin_password is not specified
storage_disks = [
    // This below map can be repeated multiple times
    {
        disk_name // storage_disks is array - mandatory
        create_option // Default is "Empty" , Optional
        disk_size_gb // Mandatory
        managed_disk_type // Default is "StandardSSD_LRS")
    }
]
*/

variable "vm_list" {
    type = map
}

variable "rg_name" {}

variable "nsg_name" {
  
}
variable "network" {
  
}

variable "tags" {
  default = {}
}

