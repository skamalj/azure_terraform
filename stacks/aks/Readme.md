<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 2.78.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.1.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aks-cluster"></a> [aks-cluster](#module\_aks-cluster) | ../../modules/aks | n/a |
| <a name="module_aks-pool"></a> [aks-pool](#module\_aks-pool) | ../../modules/aks-nodepool | n/a |
| <a name="module_aks-pool-2"></a> [aks-pool-2](#module\_aks-pool-2) | ../../modules/aks-nodepool | n/a |
| <a name="module_aks-pool-win"></a> [aks-pool-win](#module\_aks-pool-win) | ../../modules/aks-nodepool | n/a |
| <a name="module_rg"></a> [rg](#module\_rg) | ../../modules/resourcegroup | n/a |
| <a name="module_subnets"></a> [subnets](#module\_subnets) | ../../modules/subnets | n/a |
| <a name="module_vnet"></a> [vnet](#module\_vnet) | ../../modules/vnet | n/a |

## Resources

| Name | Type |
|------|------|
| [azurerm_log_analytics_workspace.akslaws](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/log_analytics_workspace) | resource |
| [azurerm_role_assignment.aks-net-contributor](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aks_admin_group_object_ids"></a> [aks\_admin\_group\_object\_ids](#input\_aks\_admin\_group\_object\_ids) | n/a | `any` | n/a | yes |
| <a name="input_api_server_authorized_ip_ranges"></a> [api\_server\_authorized\_ip\_ranges](#input\_api\_server\_authorized\_ip\_ranges) | n/a | `string` | `"223.181.146.8/32"` | no |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | n/a | `string` | `"1.22.6"` | no |
| <a name="input_disable_pod_subnet"></a> [disable\_pod\_subnet](#input\_disable\_pod\_subnet) | n/a | `bool` | `false` | no |
| <a name="input_enable_windows_pool"></a> [enable\_windows\_pool](#input\_enable\_windows\_pool) | n/a | `bool` | `false` | no |
| <a name="input_network_plugin"></a> [network\_plugin](#input\_network\_plugin) | n/a | `string` | `"azure"` | no |
| <a name="input_pod_cidr"></a> [pod\_cidr](#input\_pod\_cidr) | n/a | `string` | `"192.168.0.0/16"` | no |
| <a name="input_poolrgname"></a> [poolrgname](#input\_poolrgname) | n/a | `any` | n/a | yes |
| <a name="input_private_cluster_enabled"></a> [private\_cluster\_enabled](#input\_private\_cluster\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_rgname"></a> [rgname](#input\_rgname) | n/a | `any` | n/a | yes |
| <a name="input_subnet_props"></a> [subnet\_props](#input\_subnet\_props) | n/a | `map` | n/a | yes |
| <a name="input_vnet_address_space"></a> [vnet\_address\_space](#input\_vnet\_address\_space) | n/a | `list(string)` | n/a | yes |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aks-fqdn"></a> [aks-fqdn](#output\_aks-fqdn) | n/a |
| <a name="output_aks_principal"></a> [aks\_principal](#output\_aks\_principal) | n/a |
| <a name="output_vnet_id"></a> [vnet\_id](#output\_vnet\_id) | n/a |
<!-- END_TF_DOCS -->