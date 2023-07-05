################################################
# Demonstration of enabling diagnostic settings
# on a target resource
# Sample taken from Terraform docsa
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/monitor_diagnostic_setting
#
# Note that the diagnostic settings module is intended to be called as a sub module to various
# other resource modules, so it should not normally appear in the root module.
################################################

resource "random_string" "random" {
  length  = 8
  special = false
}


resource "azurerm_storage_account" "diagnostic_target" {
  name                     = "lostfdiagstg"
  resource_group_name      = module.diag_rg.rg_name
  location                 = module.diag_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_key_vault" "example" {
  name                       = "lokv${random_string.random.result}"
  resource_group_name        = module.diag_rg.rg_name
  location                   = module.diag_rg.location
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days = 7
  purge_protection_enabled   = false
  sku_name                   = "standard"
}

module "diag_rg" {
  source                      = "git::https://github.com/Loshea/tf_azure_resources.git//modules/rg?ref=v0.1.0"
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
