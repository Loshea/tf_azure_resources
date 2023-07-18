<!-- BEGIN_TF_DOCS -->
## Version Requirements
|  Module Version | Terraform Version | AzureRM Version |
|-----------------|-------------------|-----------------|
| < 1.0.0         | 1.5.x             | 3.4             |

## Usage

```hcl

module "rg1" {
  source                      = "../../modules/rg"
  rg_name                     = "tf_rg1"
  location                    = "East US"
  create_costview             = true
  create_budget               = true
  budget_amount               = 100
  budget_start_date           = "2023-07-01T00:00:00Z"
  notification_contact_emails = ["liam.oshea.02@gmail.com"]
  notifications = [{
    enabled        = true
    threshold      = 85.0
    operator       = "GreaterThan"
    contact_emails = ["liam.oshea.02@gmail.com"]
    contact_emails = ["liam.oshea.02@gmail.com"]
    contact_roles  = ["Owner"]
    contact_groups = []
  }]
}
```
## Providers

| Name | Version |
|------|---------|
| azurerm | >=3.4 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_consumption_budget_resource_group.rg_consumption_budget](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/consumption_budget_resource_group) | resource |
| [azurerm_monitor_action_group.rg_monitor](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_action_group) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_resource_group_cost_management_view.rg_cost_view](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group_cost_management_view) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| budget\_amount | Budget ammount for this resource group | `number` | `0` | no |
| budget\_end\_date | Budget End Date ( YYYY-mm-ddTHH:MM:SSZ) OPTIONAL | `string` | `null` | no |
| budget\_start\_date | Budget Start Date ( YYYY-mm-ddTHH:MM:SSZ) | `string` | `"2023-06-01T00:00:00Z"` | no |
| create\_budget | Create a spend budget for the resource group | `bool` | `false` | no |
| create\_costview | Enable a cost management view for this resource group | `bool` | `true` | no |
| location | Location in whcih to place the resource group | `string` | n/a | yes |
| notification\_contact\_emails | List of email addresses to notify | `list(string)` | n/a | yes |
| notifications | List of notification thresholds and targets | <pre>set(object({<br>    enabled        = bool<br>    threshold      = number<br>    operator       = string<br>    contact_emails = list(string)<br>    contact_roles  = list(string)<br>    contact_groups = list(string)<br>  }))</pre> | n/a | yes |
| rg\_name | Name of the resource group | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| location | Region the resource group resides in |
| rg\_id | ID of the resource group |
| rg\_name | Name of the resource group |
<!-- END_TF_DOCS -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
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
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
