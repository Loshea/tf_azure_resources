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
