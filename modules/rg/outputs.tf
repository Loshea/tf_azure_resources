output "rg_id" {
  value       = azurerm_resource_group.rg.id
  description = "ID of the resource group"
}

output "rg_name" {
  value       = azurerm_resource_group.rg.name
  description = "Name of the resource group"
}

output "location" {
  value       = azurerm_resource_group.rg.location
  description = "Region the resource group resides in"
}
