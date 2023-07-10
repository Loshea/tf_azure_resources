output "budget_name" {
  value       = azurerm_consumption_budget_resource_group.rg_consumption_budget.name
  description = "Name of the associated resource group budget"
}

output "budget_amount" {
  value       = azurerm_consumption_budget_resource_group.rg_consumption_budget.amount
  description = "Budget cap for the assocaited resource group"

}
output "budget_start_date" {
  value       = azurerm_consumption_budget_resource_group.rg_consumption_budget.time_period[0].start_date
  description = "Date configured budget takes effect"
}

output "budget_end_date" {
  value       = azurerm_consumption_budget_resource_group.rg_consumption_budget.time_period[0].end_date
  description = "Date configured budget ends"
}
#TODO: Determine whether we need to output the filter or notification blocks for any reason
#Can't think of one right now.  Adding notification block just for testing
output "budget_notification_settings" {
  value       = azurerm_consumption_budget_resource_group.rg_consumption_budget.notification[*]
  description = "List of budget notification settings"
}
