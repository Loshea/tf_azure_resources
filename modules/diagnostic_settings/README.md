# AKS
Create diagnostic settings to be attached to another resource.  This is intended to be called as a submodule to many other resource modules.

# Usage

```

module "k8scluster" {
    source = "git::https://github.com/Loshea/tf_azure_resources.git/modules/diagnostic_settings"

}
```
## Variables
The Diagnostics Settings module defines the following outputs
|Variable| Value | Nullable |
|--------|------------|------|
|enable_diagnostics|Whether diagnostics should be enabled for this resource|No|
|name|Name of the diagnostic settings|No|
|target_resource_id| The ID on which to enable diagnostic data | No|
|enabled_logs| Selection of which logs to enable for this resource |Yes |
|metrics| Selection of metrics to enable |Yes|
|storage_account_id|ID Of the storage account to which diagnostic data are being sent|Yes|
|eventhub_name|The name of the event hub where diagnostic data should be sent|Yes|
|eventhub_authorization_rule_id|The id of an event hub namespace authorization rule use to send diagnostic data|Yes|
|log_analytics_workspace_id|The id of a log analytics workspace to which to send diagnostic data|Yes|
|log_analytics_destination_type|The type of Analytics workspace table to use for diagnostic data.  One of AzureDiagnostics,Dedicated.  Default:  AzureDiagnostics|Yes|
|partner_solution_id|The ID of the market parnet solution to which Diagnostic data should be sent|Yes|
## Outputs
The Diagnostics Settings module defines the following outputs
|Variable| Value | Sensitive |
|--------|------------|------|
|storage_account_id|ID Of the storage account to which diagnostic data are being sent|No|
|eventhub_name|The name of the event hub where diagnostic data should be sent|No|
|eventhub_authorization_rule_id|The id of an event hub namespace authorization rule use to send diagnostic data|No|
|log_analytics_workspace_id|The id of a log analytics workspace to which to send diagnostic data|No|
|log_analytics_destination_type|The type of Analytics workspace table to use for diagnostic data|No|
|partner_solution_id|The ID of the market parnet solution to which Diagnostic data should be sent|No|
