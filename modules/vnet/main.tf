/**
* # VNET
* This module provisions a virtual network, it's associated SubNets, and optional Bastion Host and Virtual Network Gateway.  This module does NOT provision Network Security Groups at this time.  See the NSG module for Network Security Groups.  Diagnostic Settings can also be configured during creation of the VNet infrastructure, provided the targeted diagnostic data end-point exists.  All resources will be created in the resource group specified for the virtual network.
*
*
* # Architecture Diagram
* Eventually, I will include a diagram of the created architecture.
*/



###############################################################################
# Implement a complete VNET with subnets, diagnostics and maybe a network
# watcher and gateway.  Peerings will likely be left to their own resource,as 
# both networks must exist at the time the peering is created.
# If I were building this out for a specific client, much of the detail would
# contain default vaules, which would actually give this module some value
#
# TODO: Possible enhancements - make a separate network gateway resource for 
# each VPN Type (S2S, P2S) with the base necessary configurations to reduce 
# configuration load
###############################################################################

# VNET
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.rg_name
  address_space       = var.address_space
  dns_servers         = var.dns_servers
  ddos_protection_plan {
    id     = var.ddos_protection_plan.id
    enable = var.ddos_protection_plan.enable
  }

  #subnets
  #TODO:  See if we can add logic in a local to detect and validate bastion and 
  #vnet gatway subnets.  
  #TODO: Detect whether a bastion subnet is allocated, and if not, merge one
  # into the list of subnets

  dynamic "subnet" {
    for_each = var.subnets
    content {
      name           = subnet.value["name"]
      address_prefix = subnet.value["address_prefix"]
      security_group = subnet.value["security_group"]
    }
  }

  tags = var.tags
}


#########################################
# Bastion Host
#########################################

resource "azurerm_public_ip" "bastionpip" {
  count               = var.enable_bastion ? 1 : 0
  name                = "${var.vnet_name}bastion-pip"
  location            = var.location
  resource_group_name = var.rg_name
  allocation_method   = "Static"
  sku                 = "Standard"

  tags = var.tags
}

resource "azurerm_bastion_host" "vnetbastion" {
  count               = var.enable_bastion ? 1 : 0
  name                = local.bastion_name
  location            = var.location
  resource_group_name = var.rg_name

  ip_configuration {
    name                 = "${var.vnet_name}bastionconfig"
    subnet_id            = data.azurerm_subnet.bastion_subnet.id
    public_ip_address_id = azurerm_public_ip.bastionpip[0].id
  }

  tags = var.tags
}
