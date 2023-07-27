/**
* # Diagnostic Settings  
* This module creates a diagnostic settings configuration to be attached to applicable resources.  This module is intended to be a sub-module to various resources.   The module allows for the configuration of one or more end points for diagnostic data: event hub, analytics workspace, storage account, or other partner solutions.
*
*
* # Architecture Diagram  
* Eventually, I will include a diagram of the created architecture.
*/
resource "azurerm_monitor_diagnostic_setting" "diags" {
  count              = var.enable_diagnostics ? 1 : 0
  name               = var.name
  target_resource_id = var.target_resource_id

  storage_account_id             = var.storage_account_id
  eventhub_name                  = var.eventhub_name
  eventhub_authorization_rule_id = var.eventhub_authorization_rule_id
  log_analytics_workspace_id     = var.log_analytics_workspace_id
  partner_solution_id            = var.partner_solution_id

  dynamic "enabled_log" {
    for_each = var.enabled_logs
    content {
      category       = enabled_log.value["category"]
      category_group = enabled_log.value["category_group"]

      retention_policy {
        enabled = enabled_log.value["retention_enabled"]
        days    = enabled_log.value["retention_days"]
      }
    }
  }

  dynamic "metric" {
    for_each = var.metrics
    content {
      category = metric.value["category"]

      retention_policy {
        enabled = metric.value["retention_enabled"]
        days    = metric.value["retention_days"]
      }
    }
  }

  lifecycle {
    precondition {
      condition     = local.valid_storage_configuration == true
      error_message = "At least one of partner_solution_id, storage_account_id, eventhub_authorization_rule_id, or partner_solution_id must be set to a valid id"
    }
  }
}
