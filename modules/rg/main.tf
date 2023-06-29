######################
# Resource Group
######################
resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.location
}

######################
# Cost View
######################
resource "azurerm_resource_group_cost_management_view" "rg_cost_view" {
  count = var.create_costview ? 1 : 0
  name  = "${var.rg_name}costmgtview"

  display_name = "Cost View per Month"
  chart_type   = "StackedColumn"
  accumulated  = false

  resource_group_id = azurerm_resource_group.rg.id
  report_type       = "Usage"
  timeframe         = "MonthToDate"

  dataset {
    granularity = "Monthly"
    aggregation {
      name        = "totalCost"
      column_name = "Cost"
    }
  }
}


######################
# Budget Items
######################

#TODO: Variableize the notification block
resource "azurerm_monitor_action_group" "rg_monitor" {
  count               = var.create_budget ? 1 : 0
  name                = "${var.rg_name}-monitor-group"
  resource_group_name = azurerm_resource_group.rg.name
  short_name          = "${var.rg_name}-monitor-group"
}

resource "azurerm_consumption_budget_resource_group" "rg_consumption_budget" {
  count             = var.create_budget ? 1 : 0
  name              = "${var.rg_name}_budget"
  resource_group_id = azurerm_resource_group.rg.id

  amount     = var.budget_amount
  time_grain = "Monthly"

  time_period {
    start_date = var.budget_start_date
    end_date   = var.budget_end_date
  }
  filter {
    dimension {
      name = "ResourceId"
      values = [
        azurerm_monitor_action_group.rg_monitor[0].id,
      ]
    }

    tag {
      name = "Purpose"
      values = [
        "TFSpendControl",
      ]
    }
  }

  notification {
    enabled   = true
    threshold = 75.0
    operator  = "EqualTo"

    contact_emails = var.notification_contact_emails
  }
}
