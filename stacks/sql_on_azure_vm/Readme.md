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
| <a name="module_mssql_on_vm"></a> [mssql\_on\_vm](#module\_mssql\_on\_vm) | ../../modules/mssql_on_vm | n/a |
| <a name="module_vms"></a> [vms](#module\_vms) | ../../modules/vm | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_data_luns"></a> [data\_luns](#input\_data\_luns) | n/a | `list` | n/a | yes |
| <a name="input_log_luns"></a> [log\_luns](#input\_log\_luns) | n/a | `list` | n/a | yes |
| <a name="input_rgname"></a> [rgname](#input\_rgname) | n/a | `string` | n/a | yes |
| <a name="input_sql_connectivity_update_password"></a> [sql\_connectivity\_update\_password](#input\_sql\_connectivity\_update\_password) | n/a | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map` | n/a | yes |
| <a name="input_temp_luns"></a> [temp\_luns](#input\_temp\_luns) | n/a | `list` | n/a | yes |
| <a name="input_vm_list"></a> [vm\_list](#input\_vm\_list) | n/a | `map` | n/a | yes |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_disks"></a> [disks](#output\_disks) | Disk attached - This output show how you can use this for debugging |
| <a name="output_server_ip"></a> [server\_ip](#output\_server\_ip) | MSSQL Instance details |
<!-- END_TF_DOCS -->