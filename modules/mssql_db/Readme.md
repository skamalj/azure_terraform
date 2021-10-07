<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | 2.5.0 |
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
| [azurerm_mssql_database.mssql_db](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_database) | resource |
| [azurerm_mssql_database.mssql_db_replica](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_database) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_pause_delay_in_minutes"></a> [auto\_pause\_delay\_in\_minutes](#input\_auto\_pause\_delay\_in\_minutes) | n/a | `number` | `60` | no |
| <a name="input_create_mode"></a> [create\_mode](#input\_create\_mode) | n/a | `string` | `"Default"` | no |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | n/a | `any` | n/a | yes |
| <a name="input_elastic_pool_id"></a> [elastic\_pool\_id](#input\_elastic\_pool\_id) | n/a | `any` | `null` | no |
| <a name="input_geo_backup_enabled"></a> [geo\_backup\_enabled](#input\_geo\_backup\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_license_type"></a> [license\_type](#input\_license\_type) | n/a | `string` | `"BasePrice"` | no |
| <a name="input_ltr"></a> [ltr](#input\_ltr) | n/a | `any` | `null` | no |
| <a name="input_max_size_gb"></a> [max\_size\_gb](#input\_max\_size\_gb) | n/a | `number` | `100` | no |
| <a name="input_read_replica_count"></a> [read\_replica\_count](#input\_read\_replica\_count) | n/a | `number` | `2` | no |
| <a name="input_retention_days"></a> [retention\_days](#input\_retention\_days) | n/a | `any` | `null` | no |
| <a name="input_server_id"></a> [server\_id](#input\_server\_id) | n/a | `any` | n/a | yes |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | n/a | `string` | `"BC_Gen5_2"` | no |
| <a name="input_storage_account_type"></a> [storage\_account\_type](#input\_storage\_account\_type) | n/a | `string` | `"ZRS"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map` | `{}` | no |
| <a name="input_zone_redundant"></a> [zone\_redundant](#input\_zone\_redundant) | n/a | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_mssql_db"></a> [mssql\_db](#output\_mssql\_db) | MSSQL DB object |
<!-- END_TF_DOCS -->