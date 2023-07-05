
#Generate the SSH key for the cluster
resource "random_pet" "ssh_key_name" {
  prefix    = "ssh"
  separator = ""
}

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

################################
# Resource group
################################
module "tf_k8s_rg" {
  source                      = "../../modules/rg"
  rg_name                     = "tf_k8s"
  location                    = "East US"
  create_costview             = true
  create_budget               = true
  budget_amount               = 100
  budget_start_date           = "2023-07-01T00:00:00Z"
  notification_contact_emails = ["liam.oshea.02@gmail.com"]
  notifications = [{
    enabled        = true
    threshold      = 85.0
    operator       = "GreaterThan"
    contact_emails = ["liam.oshea.02@gmail.com"]
    contact_roles  = ["Owner"]
    contact_groups = []
  }]
}

################################
# AKS Cluster
################################
resource "random_pet" "azurerm_kubernetes_cluster_dns_prefix" {
  prefix = "dns"
}


module "k8scluster" {
  source            = "../../modules/aks"
  rg_name           = module.tf_k8s_rg.rg_name
  location          = module.tf_k8s_rg.location
  cluster_name      = "example_cluster"
  dns_prefix        = random_pet.azurerm_kubernetes_cluster_dns_prefix.id
  node_pool_name    = "examplepool"
  node_vm_size      = "Standard_D2_v2"
  node_count        = 3
  admin_username    = "ubuntu"
  ssh_key           = jsondecode(azapi_resource_action.ssh_public_key_gen.output).publicKey
  network_plugin    = "kubenet"
  load_balancer_sku = "standard"
  #msi_id            = null
}

################################
# TODO:  Add budget to the auto-
# generated node resource group
# Budgeting
################################
