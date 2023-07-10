locals {
  rg_filter = [{
    name   = "ResourceGroupName"
    values = [azurerm_resource_group.rg.name]
  }]
}
