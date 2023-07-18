module "vnet" {
  source        = "../../"
  vnet_name     = "tf-vnet1"
  rg_name       = module.rg1.rg_name
  location      = module.rg1.location
  address_space = ["10.1.0.0/16"]
  subnets = [
    {
      name           = "GatewaySubnet"
      address_prefix = "10.1.1.0/24"
      security_group = null
    },
    {
      name           = "AzureBastionSubnet"
      address_prefix = "10.1.2.0/26"
      security_group = null
    },
    {
      name           = "default"
      address_prefix = "10.1.3.0/24"
      security_group = null
    }
  ]

  enable_bastion = false
  # bastion_host_name = "tf-vnet1-bastion-host"

}
