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
| [azurerm_kubernetes_cluster_node_pool.aks_pool](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster_node_pool) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_auto_scaling"></a> [enable\_auto\_scaling](#input\_enable\_auto\_scaling) | n/a | `bool` | `true` | no |
| <a name="input_enable_host_encryption"></a> [enable\_host\_encryption](#input\_enable\_host\_encryption) | n/a | `bool` | `false` | no |
| <a name="input_enable_node_public_ip"></a> [enable\_node\_public\_ip](#input\_enable\_node\_public\_ip) | n/a | `bool` | `false` | no |
| <a name="input_fips_enabled"></a> [fips\_enabled](#input\_fips\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_kubernetes_cluster_id"></a> [kubernetes\_cluster\_id](#input\_kubernetes\_cluster\_id) | n/a | `any` | n/a | yes |
| <a name="input_max_count"></a> [max\_count](#input\_max\_count) | n/a | `number` | `5` | no |
| <a name="input_max_pods"></a> [max\_pods](#input\_max\_pods) | n/a | `number` | `30` | no |
| <a name="input_max_surge"></a> [max\_surge](#input\_max\_surge) | n/a | `string` | `"1"` | no |
| <a name="input_min_count"></a> [min\_count](#input\_min\_count) | n/a | `number` | `1` | no |
| <a name="input_mode"></a> [mode](#input\_mode) | n/a | `string` | `"User"` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `any` | n/a | yes |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | n/a | `number` | `1` | no |
| <a name="input_node_labels"></a> [node\_labels](#input\_node\_labels) | n/a | `any` | `null` | no |
| <a name="input_orchestrator_version"></a> [orchestrator\_version](#input\_orchestrator\_version) | n/a | `any` | n/a | yes |
| <a name="input_os_sku"></a> [os\_sku](#input\_os\_sku) | n/a | `string` | `"Ubuntu"` | no |
| <a name="input_os_type"></a> [os\_type](#input\_os\_type) | n/a | `string` | `"Linux"` | no |
| <a name="input_pod_subnet_id"></a> [pod\_subnet\_id](#input\_pod\_subnet\_id) | n/a | `any` | `null` | no |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | n/a | `string` | `"Standard_D2_v2"` | no |
| <a name="input_vnet_subnet_id"></a> [vnet\_subnet\_id](#input\_vnet\_subnet\_id) | n/a | `any` | n/a | yes |
| <a name="input_zones"></a> [zones](#input\_zones) | n/a | `list` | <pre>[<br>  1,<br>  2<br>]</pre> | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->