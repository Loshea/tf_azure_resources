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

output "budget_name" {
  value       = length(module.rg_budget) > 0 ? one(module.rg_budget).budget_name : null
  description = "Name of the associated resource group budget"
}

output "costview_name" {
  value       = length(azurerm_resource_group_cost_management_view.rg_cost_view) > 0 ? one(azurerm_resource_group_cost_management_view.rg_cost_view).name : null
  description = "Name of the created cost view"
}
