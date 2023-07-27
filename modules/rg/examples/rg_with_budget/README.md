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
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.62.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_rg1"></a> [rg1](#module\_rg1) | git::https://github.com/Loshea/tf_azure_resources.git//modules/rg | v0.14.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_virtual_machine.tf_test_vm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine) | resource |
| [azurerm_network_interface.tf_test_nic](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface) | resource |
| [azurerm_subnet.tf_test_subnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_virtual_network.tf_test_vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network) | resource |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_budget_name"></a> [budget\_name](#output\_budget\_name) | Name of the budget associated with the resource grouo |
| <a name="output_location"></a> [location](#output\_location) | Location the new resource group was created in |
| <a name="output_rg_name"></a> [rg\_name](#output\_rg\_name) | Name of the resource group |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
