output "key_data" {
  value       = azapi_resource.ssh_public_key.body
  sensitive   = true
  description = "The public key content for the cluster"
}

output "resource_group_name" {
  value       = module.tf_k8s_rg.rg_name
  description = "Name of the resource group containing the cluster"
}

output "kubernetes_cluster_name" {
  value       = module.k8scluster.cluster_name
  description = "The aks cluster name"
}

output "client_certificate" {
  value       = module.k8scluster.client_certificate
  sensitive   = true
  description = "AKS cluster client certificate"
}

output "client_key" {
  value       = module.k8scluster.client_key
  description = "Cluster Client Key"
  sensitive   = true
}

output "cluster_ca_certificate" {
  value       = module.k8scluster.cluster_ca_certificate
  description = "Cluster CA Certificate"
  sensitive   = true
}

output "cluster_password" {
  value       = module.k8scluster.cluster_password
  description = "AKS Cluster user password"
  sensitive   = true
}

output "cluster_username" {
  value       = module.k8scluster.cluster_username
  description = "AKS Cluster username"
  sensitive   = true
}

output "host" {
  value       = module.k8scluster.host
  description = "AKS cluster host name"
  sensitive   = true
}

output "kube_config" {
  value       = module.k8scluster.kube_config
  description = "Raw aks cluster config"
  sensitive   = true
}

output "node_rg_name" {
  value       = module.k8scluster.node_rg_name
  description = "Name of the auto generated resource group containing the cluster resources"
}

output "node_rg_id" {
  value       = module.k8scluster.node_rg_id
  description = "Resource ID of the auto generated resource group containing the cluster resources"
}
