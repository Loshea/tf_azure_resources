output "vnet_name" {
  value       = azurerm_virtual_network.vnet.name
  description = "Name of the new Virtual Network"
}

output "vnet_id" {
  value       = azurerm_virtual_network.vnet.id
  description = "ID of the new Virtual Network"
}

output "subnets" {
  value       = azurerm_virtual_network.vnet.subnet[*].name
  description = "List of subnets created in the Virtual Network"
}

output "bastion_host_ip" {

  value       = var.enable_bastion ? azurerm_public_ip.bastionpip[0].ip_address : "Bastion Not Enabled"
  description = "IP Address of the bastion host"
}

output "bastion_host_name" {
  value       = var.enable_bastion ? azurerm_bastion_host.vnetbastion[0].name : "Bastion Not Enabled"
  description = "Name of the bastion host"
}

#TODO: Create output variables for Bastion and Gateway subnet ids
