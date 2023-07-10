
module "rg1" {
  source            = "git::https://github.com/Loshea/tf_azure_resources.git//modules/rg?ref=v0.12.0"
  rg_name           = "tf_rg1"
  location          = "East US"
  create_costview   = true
  create_budget     = true
  budget_amount     = 100
  budget_start_date = "2023-07-01T00:00:00Z"
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
