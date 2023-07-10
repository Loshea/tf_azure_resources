module "example_budget" {
  source            = "git::https://github.com/Loshea/tf_azure_resources.git//modules/budget?ref=v0.11.0"
  rg_id             = azurerm_resource_group.rg_test.id
  budget_name       = "tf_rg1_budget"
  budget_amount     = 100
  budget_start_date = "2023-07-01T00:00:00Z"
  filter_dimensions = [{
    name   = "ResourceGroupName"
    values = [azurerm_resource_group.rg_test.name]
  }]
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
