terraform {
  backend "azurerm" {
    resource_group_name  = "liam_tf_state"
    storage_account_name = "losdevtfstate"
    container_name       = "tfstate"
    key                  = "loshea.tfstate"
  }
}
