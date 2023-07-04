output "cluster_name" {
  value       = azurerm_kubernetes_cluster.k8s.name
  description = "Name of the k8s cluster"
}

output "client_certificate" {
  value       = azurerm_kubernetes_cluster.k8s.kube_config[0].client_certificate
  sensitive   = true
  description = "AKS cluster client certificate"
}

output "client_key" {
  value       = azurerm_kubernetes_cluster.k8s.kube_config[0].client_key
  description = "Cluster Client Key"
}

output "cluster_ca_certificate" {
  value       = azurerm_kubernetes_cluster.k8s.kube_config[0].cluster_ca_certificate
  description = "Cluster CA Certificate"
  sensitive   = true
}

output "cluster_password" {
  value       = azurerm_kubernetes_cluster.k8s.kube_config[0].password
  description = "AKS Cluster user password"
  sensitive   = true
}

output "cluster_username" {
  value       = azurerm_kubernetes_cluster.k8s.kube_config[0].username
  description = "AKS Cluster username"
  sensitive   = true
}

output "host" {
  value       = azurerm_kubernetes_cluster.k8s.kube_config[0].host
  description = "AKS cluster host name"
  sensitive   = true
}

output "kube_config" {
  value       = azurerm_kubernetes_cluster.k8s.kube_config_raw
  description = "Raw aks cluster config"
  sensitive   = true
}
