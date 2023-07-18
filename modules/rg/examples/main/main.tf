resource "azurerm_virtual_network" "tf_test_vnet" {
  name                = "example_vnet"
  address_space       = ["10.0.0.0/16"]
  location            = module.rg1.location
  resource_group_name = module.rg1.rg_name

}

resource "azurerm_subnet" "tf_test_subnet" {
  name                 = "default"
  resource_group_name  = module.rg1.rg_name
  virtual_network_name = azurerm_virtual_network.tf_test_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_network_interface" "tf_test_nic" {
  name                = "example-nic"
  location            = module.rg1.location
  resource_group_name = module.rg1.rg_name

  ip_configuration {
    name                          = "default"
    subnet_id                     = azurerm_subnet.tf_test_subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}


resource "azurerm_linux_virtual_machine" "tf_test_vm" {
  name                = "exampleVM-1"
  resource_group_name = module.rg1.rg_name
  location            = module.rg1.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.tf_test_nic.id
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }

  tags = {
    Purpose = "TFTesting"
  }
}
