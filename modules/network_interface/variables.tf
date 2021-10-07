/*
Example input for network interface. 
Interface name is taken from the "key". In this case it is "interface-1"
network_interfaces = {
    interface-1 = {
        enable_ip_forwarding = true
        ipconfigs = [
            {
              subnet_name      = "subnet-1"
              // Optional, value is used if provided else is generated
              private_ip       = "10.1.1.6"
              //Optional filed.  Missing filed is treated as false
              attach_public_ip =  true
              // Block is optional.  Provided values are default
              pip_properties = {
                // Any of the values if provided will be used,else default is used
                allocation_method = "Static"  # Static or Dynamic
                sku = "Standard"  # Standard or Basic
                sku_tier = "Regional"  # Regional or Global
                availability_zone = "No-Zone" Other values are Zone-Reduntant or 1,2,3
                tags = {
                  "createdBy" = "Terraform"
                }
              }
            },
            {
              subnet_name      = "subnet-1"
              attach_public_ip = false
              tags = {
                Department = "Finance"
              }
            }
        ]
    }
}
1. Tags and attach_public_ip is optional
2. Default for attach_public_ip is false
3. subnet_name cannot differe across configs within same interface
*/
variable "interface_list" {
  type = map(any)
  description = "Details for this filed are in variables.tf"
}

variable "rg_name" {}

variable "network" {}

variable "nsg_name" {}

variable "name_prefix" {
  description = "Name prefix to identify public IPs and interfaces, this can be same as VM name"
}