output "storage_account_id" {
  value       = azurerm_monitor_diagnostic_setting.diags[0].storage_account_id
  description = "ID Of the storage account to which diagnostic data are being sent"
}

output "eventhub_name" {
  value       = azurerm_monitor_diagnostic_setting.diags[0].eventhub_name
  description = "The name of the event hub where diagnostic data should be sent"
}

output "eventhub_authorization_rule_id" {
  value       = azurerm_monitor_diagnostic_setting.diags[0].eventhub_authorization_rule_id
  description = "The id of an event hub namespace authorization rule use to send diagnostic data"
}

output "log_analytics_workspace_id" {
  value       = azurerm_monitor_diagnostic_setting.diags[0].log_analytics_workspace_id
  description = "The id of a log analytics workspace to which to send diagnostic data"
}

output "log_analytics_destination_type" {
  value       = azurerm_monitor_diagnostic_setting.diags[0].log_analytics_destination_type
  description = "The type of Analytics workspace table to use for diagnostic data"
}

output "partner_solution_id" {
  value       = azurerm_monitor_diagnostic_setting.diags[0].partner_solution_id
  description = "The ID of the market parnet solution to which Diagnostic data should be sent"
}
