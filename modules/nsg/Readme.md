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

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_network_security_group.nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | NSG Location | `any` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | NSG name | `any` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `any` | n/a | yes |
| <a name="input_rule_list"></a> [rule\_list](#input\_rule\_list) | n/a | `map` | `{}` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags on resource | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nsg"></a> [nsg](#output\_nsg) | NSG Object |
<!-- END_TF_DOCS -->