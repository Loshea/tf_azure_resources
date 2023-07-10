

variable "enable_diagnostics" {
  type        = bool
  description = "Enable diagnostic settings for the attached resource"
  default     = false
}

variable "name" {
  type        = string
  description = "Name of the diagnostic settings"
  nullable    = false
}

variable "target_resource_id" {
  type        = string
  description = "Resource ID on which to enable diagnostic settings"
  nullable    = false
}

## Logging and metrics
variable "enabled_logs" {
  type = set(object({
    category          = string
    category_group    = string
    retention_enabled = bool
    retention_days    = number
  }))
  description = "Set of logs to enable and their associated retention policy"
  #default = [{category ="AuditEvent", category_group =null, retention_policy={enabled=true, days=0}}]
  default = []
}

variable "metrics" {
  type = set(object({
    category          = string
    retention_enabled = bool
    retention_days    = number
  }))
  description = "Set of metrics to enable and their associated retention policy"
  #default = [{category ="AuditEvent", category_group =null, retention_policy={enabled=true, days=0}}]
  default = []
}

## Storage locations and associated info
variable "eventhub_name" {
  type        = string
  description = "The name of the event hub where diagnostic data should be sent"
  default     = null
}

variable "eventhub_authorization_rule_id" {
  type        = string
  description = "The id of an event hub namespace authorization rule use to send diagnostic data"
  default     = null
}

variable "log_analytics_workspace_id" {
  type        = string
  description = "The id of a log analytics workspace to which to send diagnostic data"
  default     = null
}

variable "storage_account_id" {
  type        = string
  description = "The id of a storage account to which do send diagnostic data"
}

variable "log_analytics_destination_type" {
  type        = string
  description = "The type of Analytics workspace table to use for diagnostic data [AzureDiagnostics|Dedicated].  Default:  AzureDiagnostics"
  default     = "AzureDiagnostics"
  nullable    = true
  validation {
    condition = anytrue([
      var.log_analytics_destination_type == "AzureDiagnostics",
      var.log_analytics_destination_type == "Dedicated"
    ])
    error_message = "Destination type must be one of [AzureDiagnostics|Dedicated]"
  }
}

variable "partner_solution_id" {
  type        = string
  description = "The ID of the market parnet solution to which Diagnostic data should be sent"
  default     = null
}
