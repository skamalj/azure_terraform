<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | 2.5.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 2.78.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_mssql_db"></a> [mssql\_db](#module\_mssql\_db) | ../../modules/mssql_db | n/a |
| <a name="module_mssql_server"></a> [mssql\_server](#module\_mssql\_server) | ../../modules/mssql_server | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_administrator_login"></a> [administrator\_login](#input\_administrator\_login) | n/a | `string` | n/a | yes |
| <a name="input_administrator_password"></a> [administrator\_password](#input\_administrator\_password) | n/a | `string` | n/a | yes |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | n/a | `any` | n/a | yes |
| <a name="input_minimum_tls_version"></a> [minimum\_tls\_version](#input\_minimum\_tls\_version) | n/a | `string` | `"1.2"` | no |
| <a name="input_mssql_version"></a> [mssql\_version](#input\_mssql\_version) | n/a | `string` | n/a | yes |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `string` | n/a | yes |
| <a name="input_retention_days"></a> [retention\_days](#input\_retention\_days) | n/a | `number` | `7` | no |
| <a name="input_server_name"></a> [server\_name](#input\_server\_name) | n/a | `string` | n/a | yes |
| <a name="input_sp_display_name"></a> [sp\_display\_name](#input\_sp\_display\_name) | n/a | `string` | `null` | no |
| <a name="input_storage_account_name"></a> [storage\_account\_name](#input\_storage\_account\_name) | n/a | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map` | `{}` | no |
| <a name="input_use_secondary_key"></a> [use\_secondary\_key](#input\_use\_secondary\_key) | n/a | `bool` | `false` | no |
| <a name="input_user_principal_name"></a> [user\_principal\_name](#input\_user\_principal\_name) | n/a | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_mssql_server"></a> [mssql\_server](#output\_mssql\_server) | MSSQL Server Object |
<!-- END_TF_DOCS -->