# budget

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.64.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_consumption_budget_resource_group.rg_consumption_budget](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/consumption_budget_resource_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_budget_amount"></a> [budget\_amount](#input\_budget\_amount) | Budget ammount for this resource group | `number` | `0` | no |
| <a name="input_budget_end_date"></a> [budget\_end\_date](#input\_budget\_end\_date) | Budget End Date ( YYYY-MM-DDThh:mm:ssZ) OPTIONAL | `string` | `null` | no |
| <a name="input_budget_name"></a> [budget\_name](#input\_budget\_name) | Name of the budget to attach to the resource group | `string` | n/a | yes |
| <a name="input_budget_start_date"></a> [budget\_start\_date](#input\_budget\_start\_date) | Budget Start Date ( YYYY-MM-DDThh:mm:ssZ).  Date must not be prior to the beginning of this month. | `string` | n/a | yes |
| <a name="input_filter_dimensions"></a> [filter\_dimensions](#input\_filter\_dimensions) | Budget filter dimensions | <pre>set(object({<br>    name   = string<br>    values = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_filter_tags"></a> [filter\_tags](#input\_filter\_tags) | Tags to filter by in the budget | <pre>set(object({<br>    tag_name   = string<br>    tag_values = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_notifications"></a> [notifications](#input\_notifications) | List of notification thresholds and targets | <pre>set(object({<br>    enabled        = bool<br>    threshold      = number<br>    operator       = string<br>    contact_emails = list(string)<br>    contact_roles  = list(string)<br>    contact_groups = list(string)<br>  }))</pre> | <pre>[<br>  {<br>    "contact_emails": [],<br>    "contact_groups": [],<br>    "contact_roles": [],<br>    "enabled": true,<br>    "operator": "",<br>    "threshold": 0<br>  }<br>]</pre> | no |
| <a name="input_rg_id"></a> [rg\_id](#input\_rg\_id) | ID of the resource group to attach the budget to | `string` | n/a | yes |
| <a name="input_time_grain"></a> [time\_grain](#input\_time\_grain) | The time-granularity of the budget.  Default:  Monthly | `string` | `"Monthly"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_budget_amount"></a> [budget\_amount](#output\_budget\_amount) | Budget cap for the assocaited resource group |
| <a name="output_budget_end_date"></a> [budget\_end\_date](#output\_budget\_end\_date) | Date configured budget ends |
| <a name="output_budget_name"></a> [budget\_name](#output\_budget\_name) | Name of the associated resource group budget |
| <a name="output_budget_notification_settings"></a> [budget\_notification\_settings](#output\_budget\_notification\_settings) | List of budget notification settings |
| <a name="output_budget_start_date"></a> [budget\_start\_date](#output\_budget\_start\_date) | Date configured budget takes effect |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
