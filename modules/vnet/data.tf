data "azurerm_subnet" "bastion_subnet" {
  depends_on           = [azurerm_virtual_network.vnet]
  name                 = "AzureBastionSubnet"
  virtual_network_name = var.vnet_name
  resource_group_name  = var.rg_name
}
