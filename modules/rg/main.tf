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

#TODO: Variableize the notification block
#TODO: Define an object for notifications to include contact groups, emails, roles, as well as threshold and operator
resource "azurerm_monitor_action_group" "rg_monitor" {
  count               = var.create_budget ? 1 : 0
  name                = "${var.rg_name}-monitor-group"
  resource_group_name = azurerm_resource_group.rg.name
  short_name          = substr("mg-${var.rg_name}", 1, 12)
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

  #temporary default notification
  notification {
    enabled   = true
    threshold = 75.0
    operator  = "EqualTo"

    contact_emails = var.notification_contact_emails
  }

  dynamic "notification" {
    for_each = var.notifications
    content {
      enabled   = notification.value["enabled"]
      threshold = notification.value["threshold"]
      operator  = notification.value["operator"]

      contact_emails = notification.value["contact_emails"]
      contact_groups = notification.value["contact_groups"]
      contact_roles  = notification.value["contact_roles"]
    }
  }
}
