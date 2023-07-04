#TODO:  Add validators

variable "rg_name" {
  type        = string
  description = "Name of the resource group containing the cluster"
}

variable "location" {
  type        = string
  description = "Region in whcih to place the cluster"
}

variable "cluster_name" {
  type        = string
  description = "Kubernetes Cluster Name"
}

variable "dns_prefix" {
  type        = string
  description = "DNS prefix for the cluster"
}

variable "node_pool_name" {
  type        = string
  description = "Name of the default node pool"
}

variable "node_vm_size" {
  type        = string
  description = "The VM Size for the default cluster node"
}

variable "node_count" {
  type        = number
  description = "Number of nodes in the default pool"
  default     = 3
}

variable "admin_username" {
  type        = string
  description = "Linux administrator account name"
}

variable "ssh_key" {
  type        = string
  description = "Public key for the cluster"
}

variable "network_plugin" {
  type        = string
  description = "The network plugin to use [azure|kubernet]"
  default     = "kubernet"
}

variable "load_balancer_sku" {
  type        = string
  description = "SKU for the ingress loadbalancer"
  default     = "standard"
}

# variable "msi_id" {
#   type        = string
#   description = "The Managed Service Identity ID. Set this value if you're running the cluster using Managed Identity"
#   default     = null
# }
