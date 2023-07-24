# main

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.4 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~>3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.63.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.5.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_diag_rg"></a> [diag\_rg](#module\_diag\_rg) | git::https://github.com/Loshea/tf_azure_resources.git//modules/rg | v0.1.0 |
| <a name="module_kv_diagnostic_settings"></a> [kv\_diagnostic\_settings](#module\_kv\_diagnostic\_settings) | git::https://github.com/Loshea/tf_azure_resources.git//modules/diagnostic_settings | v0.1.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_key_vault.example](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | resource |
| [azurerm_storage_account.diagnostic_target](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [random_string.random](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [azurerm_client_config.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/client_config) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_keyvault_name"></a> [keyvault\_name](#output\_keyvault\_name) | the name of the keyvault created for the exercise |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
