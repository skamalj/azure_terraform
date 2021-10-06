variable "resource_group_name" {
  
}
variable "name" {
  description = "NSG name"
}
variable "location" {
  description = "NSG Location"
}

/* Example rule
rule_list = {
    sql_server_and_rdp_access = {
        name = "Rule name, this is the key in map"                        
        description = "Some descriptop - optional"                 
        priority  = "Priority - optional , default is 100"                   
        direction  = "Inward (Default), Outward"                 
        access  = "Allow (Default), Deny"                     
        protocol = "TCP (Default), for others look at documentation"  
        ## Of the below pairs only one from each group can be specified ##                  
        source_port_ranges          
        source_port_range  - "Default is *, Ignored id source_port_ranges is specified"
        destination_port_range      
        destination_port_ranges = ["22", "3389","1433"]                                 
        source_address_prefixes     
        source_address_prefix                                   
        destination_address_prefixes
        destination_address_prefix  
    }
}
*/
variable "rule_list" {
  type = map
  default = {}
}

variable "tags" {
  type = map
  default = {}
  description = "Tags on resource"
}

