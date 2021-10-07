<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 2.78.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >= 2.78.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vm_disks"></a> [vm\_disks](#module\_vm\_disks) | ../managed_disks | n/a |
| <a name="module_vnet_interfaces"></a> [vnet\_interfaces](#module\_vnet\_interfaces) | ../network_interface | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_virtual_machine.vms](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine) | resource |
| [azurerm_virtual_machine_data_disk_attachment.vm_disk_attach](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_data_disk_attachment) | resource |
| [azurerm_resource_group.resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_network"></a> [network](#input\_network) | n/a | `any` | n/a | yes |
| <a name="input_nsg_name"></a> [nsg\_name](#input\_nsg\_name) | n/a | `any` | n/a | yes |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | n/a | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map` | `{}` | no |
| <a name="input_vm_list"></a> [vm\_list](#input\_vm\_list) | n/a | `map` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_managed_disks"></a> [managed\_disks](#output\_managed\_disks) | List of interfaces created |
| <a name="output_vms"></a> [vms](#output\_vms) | Returns whole list of VM created |
| <a name="output_vnet_interfaces"></a> [vnet\_interfaces](#output\_vnet\_interfaces) | List of interfaces created |
<!-- END_TF_DOCS -->