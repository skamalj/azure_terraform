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
| [azurerm_kubernetes_cluster.aks](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster) | resource |
| [azurerm_resource_group.resource_group](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aci_subnet_name"></a> [aci\_subnet\_name](#input\_aci\_subnet\_name) | n/a | `any` | `null` | no |
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | n/a | `any` | `null` | no |
| <a name="input_aks_admin_group_object_ids"></a> [aks\_admin\_group\_object\_ids](#input\_aks\_admin\_group\_object\_ids) | n/a | `any` | n/a | yes |
| <a name="input_api_server_authorized_ip_ranges"></a> [api\_server\_authorized\_ip\_ranges](#input\_api\_server\_authorized\_ip\_ranges) | n/a | `list` | <pre>[<br>  "Your commma separated IP ranges"<br>]</pre> | no |
| <a name="input_automatic_channel_upgrade"></a> [automatic\_channel\_upgrade](#input\_automatic\_channel\_upgrade) | n/a | `string` | `"stable"` | no |
| <a name="input_azure_policy_enabled"></a> [azure\_policy\_enabled](#input\_azure\_policy\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_create_ingress_application_gateway"></a> [create\_ingress\_application\_gateway](#input\_create\_ingress\_application\_gateway) | n/a | `bool` | `true` | no |
| <a name="input_default_node_pool_name"></a> [default\_node\_pool\_name](#input\_default\_node\_pool\_name) | n/a | `string` | `"defaultpool"` | no |
| <a name="input_disk_encryption_set_id"></a> [disk\_encryption\_set\_id](#input\_disk\_encryption\_set\_id) | n/a | `any` | `null` | no |
| <a name="input_docker_bridge_cidr"></a> [docker\_bridge\_cidr](#input\_docker\_bridge\_cidr) | n/a | `string` | `"172.17.0.1/16"` | no |
| <a name="input_enable_host_encryption"></a> [enable\_host\_encryption](#input\_enable\_host\_encryption) | n/a | `bool` | `false` | no |
| <a name="input_enable_node_public_ip"></a> [enable\_node\_public\_ip](#input\_enable\_node\_public\_ip) | n/a | `bool` | `false` | no |
| <a name="input_fips_enabled"></a> [fips\_enabled](#input\_fips\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_http_application_routing_enabled"></a> [http\_application\_routing\_enabled](#input\_http\_application\_routing\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_ingress_application_gateway_id"></a> [ingress\_application\_gateway\_id](#input\_ingress\_application\_gateway\_id) | n/a | `any` | `null` | no |
| <a name="input_ingress_application_gateway_name"></a> [ingress\_application\_gateway\_name](#input\_ingress\_application\_gateway\_name) | n/a | `any` | `null` | no |
| <a name="input_ingress_application_gateway_subnet_id"></a> [ingress\_application\_gateway\_subnet\_id](#input\_ingress\_application\_gateway\_subnet\_id) | n/a | `any` | `null` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | n/a | `string` | `"1.22.6"` | no |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | n/a | `any` | `null` | no |
| <a name="input_maintenance_window_day"></a> [maintenance\_window\_day](#input\_maintenance\_window\_day) | n/a | `string` | `"Sunday"` | no |
| <a name="input_maintenance_window_hours"></a> [maintenance\_window\_hours](#input\_maintenance\_window\_hours) | n/a | `list` | <pre>[<br>  "21",<br>  "23"<br>]</pre> | no |
| <a name="input_max_count"></a> [max\_count](#input\_max\_count) | n/a | `number` | `5` | no |
| <a name="input_max_pods"></a> [max\_pods](#input\_max\_pods) | n/a | `number` | `30` | no |
| <a name="input_min_count"></a> [min\_count](#input\_min\_count) | n/a | `number` | `1` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `any` | n/a | yes |
| <a name="input_network_plugin"></a> [network\_plugin](#input\_network\_plugin) | n/a | `string` | `"azure"` | no |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | n/a | `number` | `1` | no |
| <a name="input_node_labels"></a> [node\_labels](#input\_node\_labels) | n/a | `map` | <pre>{<br>  "type": "default"<br>}</pre> | no |
| <a name="input_node_pool_resource_group_name"></a> [node\_pool\_resource\_group\_name](#input\_node\_pool\_resource\_group\_name) | n/a | `any` | n/a | yes |
| <a name="input_node_subnet_id"></a> [node\_subnet\_id](#input\_node\_subnet\_id) | n/a | `any` | n/a | yes |
| <a name="input_oidc_issuer_enabled"></a> [oidc\_issuer\_enabled](#input\_oidc\_issuer\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_open_service_mesh_enabled"></a> [open\_service\_mesh\_enabled](#input\_open\_service\_mesh\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_outbound_type"></a> [outbound\_type](#input\_outbound\_type) | n/a | `string` | `"loadBalancer"` | no |
| <a name="input_pod_cidr"></a> [pod\_cidr](#input\_pod\_cidr) | n/a | `any` | `null` | no |
| <a name="input_pod_subnet_id"></a> [pod\_subnet\_id](#input\_pod\_subnet\_id) | n/a | `any` | `null` | no |
| <a name="input_pool_max_surge_for_upgrade"></a> [pool\_max\_surge\_for\_upgrade](#input\_pool\_max\_surge\_for\_upgrade) | n/a | `string` | `"1"` | no |
| <a name="input_private_cluster_enabled"></a> [private\_cluster\_enabled](#input\_private\_cluster\_enabled) | n/a | `bool` | `false` | no |
| <a name="input_private_cluster_public_fqdn_enabled"></a> [private\_cluster\_public\_fqdn\_enabled](#input\_private\_cluster\_public\_fqdn\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | n/a | `any` | n/a | yes |
| <a name="input_role_based_access_control_enabled"></a> [role\_based\_access\_control\_enabled](#input\_role\_based\_access\_control\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_secret_rotation_interval"></a> [secret\_rotation\_interval](#input\_secret\_rotation\_interval) | n/a | `string` | `"6m"` | no |
| <a name="input_service_cidr"></a> [service\_cidr](#input\_service\_cidr) | n/a | `string` | `"172.16.0.0/16"` | no |
| <a name="input_ssh_key_data"></a> [ssh\_key\_data](#input\_ssh\_key\_data) | n/a | `any` | `null` | no |
| <a name="input_vm_size"></a> [vm\_size](#input\_vm\_size) | n/a | `string` | `"Standard_D2_v2"` | no |
| <a name="input_win_admin_password"></a> [win\_admin\_password](#input\_win\_admin\_password) | n/a | `bool` | `false` | no |
| <a name="input_win_admin_username"></a> [win\_admin\_username](#input\_win\_admin\_username) | n/a | `any` | `null` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | n/a | `list` | <pre>[<br>  1,<br>  2<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aks_principal"></a> [aks\_principal](#output\_aks\_principal) | n/a |
| <a name="output_aksfqdn"></a> [aksfqdn](#output\_aksfqdn) | AKS Cluster ID |
| <a name="output_aksid"></a> [aksid](#output\_aksid) | AKS Cluster ID |
<!-- END_TF_DOCS -->