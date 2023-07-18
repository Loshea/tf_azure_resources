
module "kv_diagnostic_settings" {
  source             = "git::https://github.com/Loshea/tf_azure_resources.git//modules/diagnostic_settings?ref=v0.1.0"
  enable_diagnostics = true
  name               = lower("${azurerm_key_vault.example.name}-diagnostics")
  target_resource_id = azurerm_key_vault.example.id
  storage_account_id = azurerm_storage_account.diagnostic_target.id
  enabled_logs = [
    {
      category          = "AuditEvent",
      category_group    = null,
      retention_days    = 30,
      retention_enabled = true
  }]
}
