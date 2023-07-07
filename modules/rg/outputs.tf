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

output "action_group_id" {
  value       = azurerm_monitor_action_group.rg_monitor[0].id
  description = "Resource ID of the Action group created for monitoring this resource group"
}

output "consumption_budget_id" {
  value       = azurerm_consumption_budget_resource_group.rg_consumption_budget[0].id
  description = "Resource ID of the Consumption Budget for this resource group"
}
