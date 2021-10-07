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
| [azurerm_public_ip.pip](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/public_ip) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allocation_method"></a> [allocation\_method](#input\_allocation\_method) | Choose allocation method - Static or Dynamic | `string` | `"Static"` | no |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | Provide this only with Standard sku. Other values are Zone-Reduntant or 1,2,3 | `string` | `"No-Zone"` | no |
| <a name="input_pip_name"></a> [pip\_name](#input\_pip\_name) | Public IP address name | `any` | n/a | yes |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | n/a | `any` | n/a | yes |
| <a name="input_sku"></a> [sku](#input\_sku) | Provide sku value which can be Standard or Basic | `string` | `"Standard"` | no |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | Provide sku\_tier value which can be Regional or Global | `string` | `"Regional"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags on resource | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_pip"></a> [pip](#output\_pip) | Returns PIP object.  Access address as pip.ip\_address |
<!-- END_TF_DOCS -->