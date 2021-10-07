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
| [azurerm_mssql_virtual_machine.mssql_on_vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/mssql_virtual_machine) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_data_file_path"></a> [data\_file\_path](#input\_data\_file\_path) | n/a | `string` | `"F:\\data"` | no |
| <a name="input_data_luns"></a> [data\_luns](#input\_data\_luns) | n/a | `list` | n/a | yes |
| <a name="input_disk_type"></a> [disk\_type](#input\_disk\_type) | n/a | `string` | `"NEW"` | no |
| <a name="input_log_file_path"></a> [log\_file\_path](#input\_log\_file\_path) | n/a | `string` | `"G:\\data"` | no |
| <a name="input_log_luns"></a> [log\_luns](#input\_log\_luns) | n/a | `list` | n/a | yes |
| <a name="input_maintenance_window_duration_in_minutes"></a> [maintenance\_window\_duration\_in\_minutes](#input\_maintenance\_window\_duration\_in\_minutes) | n/a | `number` | `60` | no |
| <a name="input_maintenance_window_starting_hour"></a> [maintenance\_window\_starting\_hour](#input\_maintenance\_window\_starting\_hour) | n/a | `number` | `2` | no |
| <a name="input_patching_day_of_week"></a> [patching\_day\_of\_week](#input\_patching\_day\_of\_week) | n/a | `string` | `"Saturday"` | no |
| <a name="input_r_services_enabled"></a> [r\_services\_enabled](#input\_r\_services\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_retention_period_in_days"></a> [retention\_period\_in\_days](#input\_retention\_period\_in\_days) | n/a | `number` | `7` | no |
| <a name="input_sql_connectivity_port"></a> [sql\_connectivity\_port](#input\_sql\_connectivity\_port) | n/a | `number` | `1433` | no |
| <a name="input_sql_connectivity_type"></a> [sql\_connectivity\_type](#input\_sql\_connectivity\_type) | n/a | `string` | `"PRIVATE"` | no |
| <a name="input_sql_connectivity_update_password"></a> [sql\_connectivity\_update\_password](#input\_sql\_connectivity\_update\_password) | n/a | `any` | n/a | yes |
| <a name="input_sql_connectivity_update_username"></a> [sql\_connectivity\_update\_username](#input\_sql\_connectivity\_update\_username) | n/a | `string` | `"sqllogin"` | no |
| <a name="input_sql_license_type"></a> [sql\_license\_type](#input\_sql\_license\_type) | n/a | `string` | `"PAYG"` | no |
| <a name="input_storage_account_access_key"></a> [storage\_account\_access\_key](#input\_storage\_account\_access\_key) | n/a | `any` | `null` | no |
| <a name="input_storage_blob_endpoint"></a> [storage\_blob\_endpoint](#input\_storage\_blob\_endpoint) | n/a | `any` | `null` | no |
| <a name="input_storage_workload_type"></a> [storage\_workload\_type](#input\_storage\_workload\_type) | n/a | `string` | `"GENERAL"` | no |
| <a name="input_temp_file_path"></a> [temp\_file\_path](#input\_temp\_file\_path) | n/a | `string` | `"H:\\data"` | no |
| <a name="input_temp_luns"></a> [temp\_luns](#input\_temp\_luns) | n/a | `list` | n/a | yes |
| <a name="input_virtual_machine_id"></a> [virtual\_machine\_id](#input\_virtual\_machine\_id) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_mssql_server"></a> [mssql\_server](#output\_mssql\_server) | MSSQL Server On VM ID |
<!-- END_TF_DOCS -->