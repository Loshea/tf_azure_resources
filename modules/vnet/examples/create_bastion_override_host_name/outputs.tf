output "vnet_name" {
  value       = module.vnet.vnet_name
  description = "Name of the new Virtual Network"
}

output "vnet_id" {
  value       = module.vnet.vnet_id
  description = "ID of the new Virtual Network"
}

output "subnets" {
  value       = module.vnet.subnets
  description = "List of subnets created in the Virtual Network"
}

output "bastion_host_ip" {

  value       = module.vnet.bastion_host_ip
  description = "IP Address of the bastion host"
}

output "bastion_host_name" {
  value       = module.vnet.bastion_host_name
  description = "Bastion Host Public IP Address"
}
