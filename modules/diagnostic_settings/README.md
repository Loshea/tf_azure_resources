# Diagnostic Settings  
This module creates a diagnostic settings configuration to be attached to applicable resources.  This module is intended to be a sub-module to various resources.   The module allows for the configuration of one or more end points for diagnostic data: event hub, analytics workspace, storage account, or other partner solutions.

# Architecture Diagram  
Eventually, I will include a diagram of the created architecture.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.63.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_monitor_diagnostic_setting.diags](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_diagnostics"></a> [enable\_diagnostics](#input\_enable\_diagnostics) | Enable diagnostic settings for the attached resource | `bool` | `false` | no |
| <a name="input_enabled_logs"></a> [enabled\_logs](#input\_enabled\_logs) | Set of logs to enable and their associated retention policy | <pre>set(object({<br>    category          = string<br>    category_group    = string<br>    retention_enabled = bool<br>    retention_days    = number<br>  }))</pre> | `[]` | no |
| <a name="input_eventhub_authorization_rule_id"></a> [eventhub\_authorization\_rule\_id](#input\_eventhub\_authorization\_rule\_id) | The id of an event hub namespace authorization rule use to send diagnostic data | `string` | `null` | no |
| <a name="input_eventhub_name"></a> [eventhub\_name](#input\_eventhub\_name) | The name of the event hub where diagnostic data should be sent | `string` | `null` | no |
| <a name="input_log_analytics_destination_type"></a> [log\_analytics\_destination\_type](#input\_log\_analytics\_destination\_type) | The type of Analytics workspace table to use for diagnostic data [AzureDiagnostics\|Dedicated].  Default:  AzureDiagnostics | `string` | `"AzureDiagnostics"` | no |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | The id of a log analytics workspace to which to send diagnostic data | `string` | `null` | no |
| <a name="input_metrics"></a> [metrics](#input\_metrics) | Set of metrics to enable and their associated retention policy | <pre>set(object({<br>    category          = string<br>    retention_enabled = bool<br>    retention_days    = number<br>  }))</pre> | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the diagnostic settings | `string` | n/a | yes |
| <a name="input_partner_solution_id"></a> [partner\_solution\_id](#input\_partner\_solution\_id) | The ID of the market parnet solution to which Diagnostic data should be sent | `string` | `null` | no |
| <a name="input_storage_account_id"></a> [storage\_account\_id](#input\_storage\_account\_id) | The id of a storage account to which do send diagnostic data | `string` | n/a | yes |
| <a name="input_target_resource_id"></a> [target\_resource\_id](#input\_target\_resource\_id) | Resource ID on which to enable diagnostic settings | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_eventhub_authorization_rule_id"></a> [eventhub\_authorization\_rule\_id](#output\_eventhub\_authorization\_rule\_id) | The id of an event hub namespace authorization rule use to send diagnostic data |
| <a name="output_eventhub_name"></a> [eventhub\_name](#output\_eventhub\_name) | The name of the event hub where diagnostic data should be sent |
| <a name="output_log_analytics_destination_type"></a> [log\_analytics\_destination\_type](#output\_log\_analytics\_destination\_type) | The type of Analytics workspace table to use for diagnostic data |
| <a name="output_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#output\_log\_analytics\_workspace\_id) | The id of a log analytics workspace to which to send diagnostic data |
| <a name="output_partner_solution_id"></a> [partner\_solution\_id](#output\_partner\_solution\_id) | The ID of the market parnet solution to which Diagnostic data should be sent |
| <a name="output_storage_account_id"></a> [storage\_account\_id](#output\_storage\_account\_id) | ID Of the storage account to which diagnostic data are being sent |

# Examples
The [main](examples/main/) example creates a key vault and diagnostic settings, capturing the "AllAudit" diagnostic group.
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
# Diagnostic Settings  
This module creates a diagnostic settings configuration to be attached to applicable resources.  This module is intended to be a sub-module to various resources.   The module allows for the configuration of one or more end points for diagnostic data: event hub, analytics workspace, storage account, or other partner solutions.

# Architecture Diagram  
Eventually, I will include a diagram of the created architecture.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.63.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_monitor_diagnostic_setting.diags](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_diagnostics"></a> [enable\_diagnostics](#input\_enable\_diagnostics) | Enable diagnostic settings for the attached resource | `bool` | `false` | no |
| <a name="input_enabled_logs"></a> [enabled\_logs](#input\_enabled\_logs) | Set of logs to enable and their associated retention policy | <pre>set(object({<br>    category          = string<br>    category_group    = string<br>    retention_enabled = bool<br>    retention_days    = number<br>  }))</pre> | `[]` | no |
| <a name="input_eventhub_authorization_rule_id"></a> [eventhub\_authorization\_rule\_id](#input\_eventhub\_authorization\_rule\_id) | The id of an event hub namespace authorization rule use to send diagnostic data | `string` | `null` | no |
| <a name="input_eventhub_name"></a> [eventhub\_name](#input\_eventhub\_name) | The name of the event hub where diagnostic data should be sent | `string` | `null` | no |
| <a name="input_log_analytics_destination_type"></a> [log\_analytics\_destination\_type](#input\_log\_analytics\_destination\_type) | The type of Analytics workspace table to use for diagnostic data [AzureDiagnostics\|Dedicated].  Default:  AzureDiagnostics | `string` | `"AzureDiagnostics"` | no |
| <a name="input_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#input\_log\_analytics\_workspace\_id) | The id of a log analytics workspace to which to send diagnostic data | `string` | `null` | no |
| <a name="input_metrics"></a> [metrics](#input\_metrics) | Set of metrics to enable and their associated retention policy | <pre>set(object({<br>    category          = string<br>    retention_enabled = bool<br>    retention_days    = number<br>  }))</pre> | `[]` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the diagnostic settings | `string` | n/a | yes |
| <a name="input_partner_solution_id"></a> [partner\_solution\_id](#input\_partner\_solution\_id) | The ID of the market parnet solution to which Diagnostic data should be sent | `string` | `null` | no |
| <a name="input_storage_account_id"></a> [storage\_account\_id](#input\_storage\_account\_id) | The id of a storage account to which do send diagnostic data | `string` | n/a | yes |
| <a name="input_target_resource_id"></a> [target\_resource\_id](#input\_target\_resource\_id) | Resource ID on which to enable diagnostic settings | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_eventhub_authorization_rule_id"></a> [eventhub\_authorization\_rule\_id](#output\_eventhub\_authorization\_rule\_id) | The id of an event hub namespace authorization rule use to send diagnostic data |
| <a name="output_eventhub_name"></a> [eventhub\_name](#output\_eventhub\_name) | The name of the event hub where diagnostic data should be sent |
| <a name="output_log_analytics_destination_type"></a> [log\_analytics\_destination\_type](#output\_log\_analytics\_destination\_type) | The type of Analytics workspace table to use for diagnostic data |
| <a name="output_log_analytics_workspace_id"></a> [log\_analytics\_workspace\_id](#output\_log\_analytics\_workspace\_id) | The id of a log analytics workspace to which to send diagnostic data |
| <a name="output_partner_solution_id"></a> [partner\_solution\_id](#output\_partner\_solution\_id) | The ID of the market parnet solution to which Diagnostic data should be sent |
| <a name="output_storage_account_id"></a> [storage\_account\_id](#output\_storage\_account\_id) | ID Of the storage account to which diagnostic data are being sent |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
