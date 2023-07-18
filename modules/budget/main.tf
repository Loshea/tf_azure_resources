resource "azurerm_consumption_budget_resource_group" "rg_consumption_budget" {
  name              = var.budget_name
  resource_group_id = var.rg_id

  amount     = var.budget_amount
  time_grain = var.time_grain

  time_period {
    start_date = var.budget_start_date
    end_date   = var.budget_end_date
  }
  filter {
    dynamic "dimension" {
      for_each = var.filter_dimensions
      content {
        name   = dimension.value["name"]
        values = dimension.value["values"]
      }
    }

    dynamic "tag" {
      for_each = var.filter_tags
      content {
        name   = tag.value["tag_name"]
        values = tag.value["tag_values"]
      }
    }
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
