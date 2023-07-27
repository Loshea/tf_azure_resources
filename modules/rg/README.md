## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.62.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_rg_budget"></a> [rg\_budget](#module\_rg\_budget) | git::https://github.com/Loshea/tf_azure_resources.git//modules/budget | v0.11.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_resource_group_cost_management_view.rg_cost_view](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group_cost_management_view) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_budget_amount"></a> [budget\_amount](#input\_budget\_amount) | Budget ammount for this resource group | `number` | `0` | no |
| <a name="input_budget_end_date"></a> [budget\_end\_date](#input\_budget\_end\_date) | Budget End Date ( YYYY-mm-ddTHH:MM:SSZ) OPTIONAL | `string` | `null` | no |
| <a name="input_budget_start_date"></a> [budget\_start\_date](#input\_budget\_start\_date) | Budget Start Date ( YYYY-mm-ddTHH:MM:SSZ) | `string` | n/a | yes |
| <a name="input_create_budget"></a> [create\_budget](#input\_create\_budget) | Create a spend budget for the resource group | `bool` | `false` | no |
| <a name="input_create_costview"></a> [create\_costview](#input\_create\_costview) | Enable a cost management view for this resource group | `bool` | `true` | no |
| <a name="input_filter_dimensions"></a> [filter\_dimensions](#input\_filter\_dimensions) | Budget filter dimensions | <pre>set(object({<br>    name   = string<br>    values = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_filter_tags"></a> [filter\_tags](#input\_filter\_tags) | Tags to filter by in the budget | <pre>set(object({<br>    tag_name   = string<br>    tag_values = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_location"></a> [location](#input\_location) | Location in whcih to place the resource group | `string` | n/a | yes |
| <a name="input_notifications"></a> [notifications](#input\_notifications) | List of notification thresholds and targets | <pre>set(object({<br>    enabled        = bool<br>    threshold      = number<br>    operator       = string<br>    contact_emails = list(string)<br>    contact_roles  = list(string)<br>    contact_groups = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | Name of the resource group | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to the resource group | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_budget_name"></a> [budget\_name](#output\_budget\_name) | Name of the associated resource group budget |
| <a name="output_location"></a> [location](#output\_location) | Region the resource group resides in |
| <a name="output_rg_id"></a> [rg\_id](#output\_rg\_id) | ID of the resource group |
| <a name="output_rg_name"></a> [rg\_name](#output\_rg\_name) | Name of the resource group |

# Examples
The [main](examples/main/) example demonstrates the creation of a resource group and budget.
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
# RG  
Creates a resource group in the desired region.  Optionally adds a resource group consumption budget with alerting options.

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
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.62.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_rg_budget"></a> [rg\_budget](#module\_rg\_budget) | git::https://github.com/Loshea/tf_azure_resources.git//modules/budget | v0.11.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_resource_group_cost_management_view.rg_cost_view](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group_cost_management_view) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_budget_amount"></a> [budget\_amount](#input\_budget\_amount) | Budget ammount for this resource group | `number` | `0` | no |
| <a name="input_budget_end_date"></a> [budget\_end\_date](#input\_budget\_end\_date) | Budget End Date ( YYYY-mm-ddTHH:MM:SSZ) OPTIONAL | `string` | `null` | no |
| <a name="input_budget_start_date"></a> [budget\_start\_date](#input\_budget\_start\_date) | Budget Start Date ( YYYY-mm-ddTHH:MM:SSZ) | `string` | `null` | no |
| <a name="input_create_budget"></a> [create\_budget](#input\_create\_budget) | Create a spend budget for the resource group | `bool` | `false` | no |
| <a name="input_create_costview"></a> [create\_costview](#input\_create\_costview) | Enable a cost management view for this resource group | `bool` | `true` | no |
| <a name="input_filter_dimensions"></a> [filter\_dimensions](#input\_filter\_dimensions) | Budget filter dimensions | <pre>set(object({<br>    name   = string<br>    values = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_filter_tags"></a> [filter\_tags](#input\_filter\_tags) | Tags to filter by in the budget | <pre>set(object({<br>    tag_name   = string<br>    tag_values = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_location"></a> [location](#input\_location) | Location in whcih to place the resource group | `string` | n/a | yes |
| <a name="input_notifications"></a> [notifications](#input\_notifications) | List of notification thresholds and targets | <pre>set(object({<br>    enabled        = bool<br>    threshold      = number<br>    operator       = string<br>    contact_emails = list(string)<br>    contact_roles  = list(string)<br>    contact_groups = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_rg_name"></a> [rg\_name](#input\_rg\_name) | Name of the resource group | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to the resource group | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_budget_name"></a> [budget\_name](#output\_budget\_name) | Name of the associated resource group budget |
| <a name="output_costview_name"></a> [costview\_name](#output\_costview\_name) | Name of the created cost view |
| <a name="output_location"></a> [location](#output\_location) | Region the resource group resides in |
| <a name="output_rg_id"></a> [rg\_id](#output\_rg\_id) | ID of the resource group |
| <a name="output_rg_name"></a> [rg\_name](#output\_rg\_name) | Name of the resource group |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
