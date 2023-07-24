# main

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_azapi"></a> [azapi](#requirement\_azapi) | ~>1.5 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.4 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~>3.0 |
| <a name="requirement_time"></a> [time](#requirement\_time) | 0.9.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azapi"></a> [azapi](#provider\_azapi) | 1.7.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.5.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_k8scluster"></a> [k8scluster](#module\_k8scluster) | git::https://github.com/Loshea/tf_azure_resources.git//modules/aks | v0.1.0 |
| <a name="module_tf_k8s_rg"></a> [tf\_k8s\_rg](#module\_tf\_k8s\_rg) | git::https://github.com/Loshea/tf_azure_resources.git//modules/rg | v0.1.0 |

## Resources

| Name | Type |
|------|------|
| [azapi_resource.ssh_public_key](https://registry.terraform.io/providers/azure/azapi/latest/docs/resources/resource) | resource |
| [azapi_resource_action.ssh_public_key_gen](https://registry.terraform.io/providers/azure/azapi/latest/docs/resources/resource_action) | resource |
| [random_pet.azurerm_kubernetes_cluster_dns_prefix](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |
| [random_pet.ssh_key_name](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_client_certificate"></a> [client\_certificate](#output\_client\_certificate) | AKS cluster client certificate |
| <a name="output_client_key"></a> [client\_key](#output\_client\_key) | Cluster Client Key |
| <a name="output_cluster_ca_certificate"></a> [cluster\_ca\_certificate](#output\_cluster\_ca\_certificate) | Cluster CA Certificate |
| <a name="output_cluster_password"></a> [cluster\_password](#output\_cluster\_password) | AKS Cluster user password |
| <a name="output_cluster_username"></a> [cluster\_username](#output\_cluster\_username) | AKS Cluster username |
| <a name="output_host"></a> [host](#output\_host) | AKS cluster host name |
| <a name="output_key_data"></a> [key\_data](#output\_key\_data) | The public key content for the cluster |
| <a name="output_kube_config"></a> [kube\_config](#output\_kube\_config) | Raw aks cluster config |
| <a name="output_kubernetes_cluster_name"></a> [kubernetes\_cluster\_name](#output\_kubernetes\_cluster\_name) | The aks cluster name |
| <a name="output_node_rg_id"></a> [node\_rg\_id](#output\_node\_rg\_id) | Resource ID of the auto generated resource group containing the cluster resources |
| <a name="output_node_rg_name"></a> [node\_rg\_name](#output\_node\_rg\_name) | Name of the auto generated resource group containing the cluster resources |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | Name of the resource group containing the cluster |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
