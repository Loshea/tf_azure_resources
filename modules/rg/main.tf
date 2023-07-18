######################
# Resource Group
######################
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
  tags     = var.tags
}

######################
# Cost View
######################
resource "azurerm_resource_group_cost_management_view" "rg_cost_view" {
  count = var.create_costview ? 1 : 0
  name  = "${var.rg_name}perrescostview"

  display_name = "${var.rg_name} Per-Resource Cost View per Month"
  chart_type   = "Table"
  accumulated  = true

  resource_group_id = azurerm_resource_group.rg.id
  report_type       = "Usage"
  timeframe         = "MonthToDate"

  dataset {
    granularity = "Monthly"
    aggregation {
      name        = "CostByResource"
      column_name = "Cost"
    }
  }
}


######################
# Budget Items
######################

module "rg_budget" {
  count             = var.create_budget ? 1 : 0
  source            = "git::https://github.com/Loshea/tf_azure_resources.git//modules/budget?ref=v0.11.0"
  rg_id             = azurerm_resource_group.rg.id
  budget_name       = "${azurerm_resource_group.rg.name}_${azurerm_resource_group.rg.location}_budget"
  budget_amount     = var.budget_amount
  budget_start_date = var.budget_start_date
  budget_end_date   = var.budget_end_date
  #TODO Make this part a default and concat with supplied filters
  filter_dimensions = setunion(toset(var.filter_dimensions), local.rg_filter)

  filter_tags   = var.filter_tags
  notifications = var.notifications
}
