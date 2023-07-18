module "k8scluster" {
  source            = "git::https://github.com/Loshea/tf_azure_resources.git//modules/aks?ref=v0.1.0"
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
