terraform {
  required_version = ">= 1.0"

  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = ">=3.4"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}

module "rg1" {
  source = "../modules/rg"
  rg_name = "tf_rg1"
  location = "East US"
  create_costview = true
  create_budget = true
  budget_ammount = 100
  budget_start_date = "2023-06-01T00:00:00Z"
}

