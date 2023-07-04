# AKS
Create a bare bones AKS cluster.  Outputs cluster config for kubectl and [k9s](https://k9scli.io/)

# Usage

```
#Using the azure api to generate a public key for the cluster:
#TODO:  Move this into the aks module and have it toggleable
resource "azapi_resource" "ssh_public_key" {
  type      = "Microsoft.Compute/sshPublicKeys@2022-11-01"
  name      = random_pet.ssh_key_name.id
  location  = "eastus"
  parent_id = module.tf_k8s_rg.rg_id
}

resource "azapi_resource_action" "ssh_public_key_gen" {
  type        = "Microsoft.Compute/sshPublicKeys@2022-11-01"
  resource_id = azapi_resource.ssh_public_key.id
  action      = "generateKeyPair"
  method      = "POST"

  response_export_values = ["publicKey"]
}

#create the cluster:
module "k8scluster" {
    source = "git::https://github.com/Loshea/tf_azure_resources.git/modules/aks"

    rg_name           = module.tf_k8s_rg.rg_name
    location          = module.tf_k8s_rg.location
    cluster_name      = "example_cluster"
    dns_prefix        = "examplecluster"
    node_pool_name    = "examplepool"
    node_vm_size      = "Standard_D2_v2"
    node_count        = 3
    admin_username    = "ubuntu"
    ssh_key           = jsondecode(azapi_resource_action.ssh_public_key_gen.output).publicKey
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
}
```

## Generating kube config
The module outputs are sufficient to generate the kube configuration file for kubectl

```
echo "$(terraform output kube_config)" > azureaks
export KUBECONFIG='./azureaks'
```
Edit the config file and remove the lines "<< EOT" and "EOT".  Kubectl or k9s should now be able to connect to your new cluster.

## Outputs
The aks module defines the following outputs
|Variable| Value | Sensitive |
|--------|------------|------|
|cluster_name | Name of the aks cluster | No |
|client_certificate | AKS Cluster client certificate | Yes |
|client_key | AKS Cluster key | Yes |
|cluster_ca_certificate | Cluster CA certificate | Yes |
|cluster_password | Cluster management password | Yes |
|cluster_username  | Cluster management username | Yes |
|host| Cluster Host name | Yes|
|kube_config | Cluster configuration block | Yes |
|rg_name | Name of the resource group containing the cluster | No |
