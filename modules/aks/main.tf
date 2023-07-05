resource "azurerm_kubernetes_cluster" "k8s" {
  location            = var.location
  name                = var.cluster_name
  resource_group_name = var.rg_name
  dns_prefix          = var.dns_prefix

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name       = var.node_pool_name
    vm_size    = var.node_vm_size
    node_count = var.node_count
  }

  linux_profile {
    admin_username = var.admin_username

    ssh_key {
      key_data = var.ssh_key
    }
  }
  network_profile {
    network_plugin    = var.network_plugin
    load_balancer_sku = var.load_balancer_sku
  }
}
