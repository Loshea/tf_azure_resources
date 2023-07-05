locals {
  valid_storage_configuration = var.partner_solution_id != null || var.storage_account_id != null || var.eventhub_authorization_rule_id != null || var.partner_solution_id != null ? true : false
}
