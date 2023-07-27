# AKS  
This is a bare-bones AKS cluster module which is expected to add functionality over time.  Currently, the module provisions the cluster, the cluster pool resource group, and accepts admin credentials to make a basic, general-use AKS cluster with a single node pool.  

# Architecture Diagram  
Eventually, I will include a diagram of the created architecture

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.63.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_kubernetes_cluster.k8s](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | Linux administrator account name | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Kubernetes Cluster Name | `string` | n/a | yes |
| <a name="input_dns_prefix"></a> [dns\_prefix](#input\_dns\_prefix) | DNS prefix for the cluster | `string` | n/a | yes |
| <a name="input_load_balancer_sku"></a> [load\_balancer\_sku](#input\_load\_balancer\_sku) | SKU for the ingress loadbalancer | `string` | `"standard"` | no |
| <a name="input_location"></a> [location](#input\_location) | Region in whcih to place the cluster | `string` | n/a | yes |
| <a name="input_network_plugin"></a> [network\_plugin](#input\_network\_plugin) | The network plugin to use [azure\|kubernet] | `string` | `"kubernet"` | no |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | Number of nodes in the default pool | `number` | `3` | no |
| <a name="input_node_pool_name"></a> [node\_pool\_name](#input\_node\_pool\_name) | Name of the default node pool | `string` | n/a | yes |
| <a name="input_node_vm_size"></a> [node\_vm\_size](#input\_node\_vm\_size) | The VM Size for the default cluster node | `string` | n/a | yes |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | Name of the resource group containing the cluster | `string` | n/a | yes |
| <a name="input_ssh_key"></a> [ssh\_key](#input\_ssh\_key) | Public key for the cluster | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_client_certificate"></a> [client\_certificate](#output\_client\_certificate) | AKS cluster client certificate |
| <a name="output_client_key"></a> [client\_key](#output\_client\_key) | Cluster Client Key |
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | Cluster CA Certificate |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | Name of the k8s cluster |
| <a name="output_cluster_password"></a> [cluster\_password](#output\_cluster\_password) | AKS Cluster user password |
| <a name="output_cluster_username"></a> [cluster\_username](#output\_cluster\_username) | AKS Cluster username |
| <a name="output_host"></a> [host](#output\_host) | AKS cluster host name |
| <a name="output_kube_config"></a> [kube\_config](#output\_kube\_config) | Raw aks cluster config |
| <a name="output_node_rg_id"></a> [node\_rg\_id](#output\_node\_rg\_id) | Resource ID of the auto generated resource group containing the cluster resources |
| <a name="output_node_rg_name"></a> [node\_rg\_name](#output\_node\_rg\_name) | Name of the auto generated resource group containing the cluster resources |
| <a name="output_rg_name"></a> [rg\_name](#output\_rg\_name) | Name of the resource group |

# Examples
The [main](examples/main/) example generates a very basic AKS cluster.  It does NOT deploy an application to the cluster.
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
# AKS  
This is a bare-bones AKS cluster module which is expected to add functionality over time.  Currently, the module provisions the cluster, the cluster pool resource group, and accepts admin credentials to make a basic, general-use AKS cluster with a single node pool.  

# Architecture Diagram  
Eventually, I will include a diagram of the created architecture

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.63.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_kubernetes_cluster.k8s](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_username"></a> [admin\_username](#input\_admin\_username) | Linux administrator account name | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Kubernetes Cluster Name | `string` | n/a | yes |
| <a name="input_dns_prefix"></a> [dns\_prefix](#input\_dns\_prefix) | DNS prefix for the cluster | `string` | n/a | yes |
| <a name="input_load_balancer_sku"></a> [load\_balancer\_sku](#input\_load\_balancer\_sku) | SKU for the ingress loadbalancer | `string` | `"standard"` | no |
| <a name="input_location"></a> [location](#input\_location) | Region in whcih to place the cluster | `string` | n/a | yes |
| <a name="input_network_plugin"></a> [network\_plugin](#input\_network\_plugin) | The network plugin to use [azure\|kubernet] | `string` | `"kubernet"` | no |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | Number of nodes in the default pool | `number` | `3` | no |
| <a name="input_node_pool_name"></a> [node\_pool\_name](#input\_node\_pool\_name) | Name of the default node pool | `string` | n/a | yes |
| <a name="input_node_vm_size"></a> [node\_vm\_size](#input\_node\_vm\_size) | The VM Size for the default cluster node | `string` | n/a | yes |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | Name of the resource group containing the cluster | `string` | n/a | yes |
| <a name="input_ssh_key"></a> [ssh\_key](#input\_ssh\_key) | Public key for the cluster | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_client_certificate"></a> [client\_certificate](#output\_client\_certificate) | AKS cluster client certificate |
| <a name="output_client_key"></a> [client\_key](#output\_client\_key) | Cluster Client Key |
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | Cluster CA Certificate |
| <a name="output_cluster_name"></a> [cluster\_name](#output\_cluster\_name) | Name of the k8s cluster |
| <a name="output_cluster_password"></a> [cluster\_password](#output\_cluster\_password) | AKS Cluster user password |
| <a name="output_cluster_username"></a> [cluster\_username](#output\_cluster\_username) | AKS Cluster username |
| <a name="output_host"></a> [host](#output\_host) | AKS cluster host name |
| <a name="output_kube_config"></a> [kube\_config](#output\_kube\_config) | Raw aks cluster config |
| <a name="output_node_rg_id"></a> [node\_rg\_id](#output\_node\_rg\_id) | Resource ID of the auto generated resource group containing the cluster resources |
| <a name="output_node_rg_name"></a> [node\_rg\_name](#output\_node\_rg\_name) | Name of the auto generated resource group containing the cluster resources |
| <a name="output_rg_name"></a> [rg\_name](#output\_rg\_name) | Name of the resource group |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
