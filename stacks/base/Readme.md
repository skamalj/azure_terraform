<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 2.78.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_des"></a> [des](#module\_des) | ../../modules/disk_encryption_set | n/a |
| <a name="module_disk_encryption_key"></a> [disk\_encryption\_key](#module\_disk\_encryption\_key) | ../../modules/encryption_keys | n/a |
| <a name="module_key_encryption_key"></a> [key\_encryption\_key](#module\_key\_encryption\_key) | ../../modules/encryption_keys | n/a |
| <a name="module_keyvault"></a> [keyvault](#module\_keyvault) | ../../modules/keyvault | n/a |
| <a name="module_nsg"></a> [nsg](#module\_nsg) | ../../modules/nsg | n/a |
| <a name="module_rg"></a> [rg](#module\_rg) | ../../modules/resourcegroup | n/a |
| <a name="module_subnet"></a> [subnet](#module\_subnet) | ../../modules/subnets | n/a |
| <a name="module_vnet"></a> [vnet](#module\_vnet) | ../../modules/vnet | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dek_name"></a> [dek\_name](#input\_dek\_name) | n/a | `any` | n/a | yes |
| <a name="input_des_name"></a> [des\_name](#input\_des\_name) | n/a | `string` | n/a | yes |
| <a name="input_kek_name"></a> [kek\_name](#input\_kek\_name) | n/a | `any` | n/a | yes |
| <a name="input_key_vault_name"></a> [key\_vault\_name](#input\_key\_vault\_name) | n/a | `any` | n/a | yes |
| <a name="input_key_vault_roles"></a> [key\_vault\_roles](#input\_key\_vault\_roles) | n/a | `list` | <pre>[<br>  "Key Vault Administrator"<br>]</pre> | no |
| <a name="input_nsg_name"></a> [nsg\_name](#input\_nsg\_name) | n/a | `any` | n/a | yes |
| <a name="input_rgname"></a> [rgname](#input\_rgname) | n/a | `string` | n/a | yes |
| <a name="input_rule_list"></a> [rule\_list](#input\_rule\_list) | n/a | `map` | n/a | yes |
| <a name="input_subnet_props"></a> [subnet\_props](#input\_subnet\_props) | n/a | <pre>map(object({<br>    name = string<br>    address_prefixes = list(string)<br>  }))</pre> | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map` | <pre>{<br>  "project": "MSSQL On Azure VM"<br>}</pre> | no |
| <a name="input_vm_list"></a> [vm\_list](#input\_vm\_list) | n/a | `map` | n/a | yes |
| <a name="input_vnet_address_space"></a> [vnet\_address\_space](#input\_vnet\_address\_space) | n/a | `list(string)` | n/a | yes |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_des_identity"></a> [des\_identity](#output\_des\_identity) | Disk Encryption Set ID |
| <a name="output_keyvault_id"></a> [keyvault\_id](#output\_keyvault\_id) | Key Vault ID |
<!-- END_TF_DOCS -->