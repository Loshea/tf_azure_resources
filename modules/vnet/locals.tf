locals {
  #TODO: Work out a condition such that IF bastion is set, then bastion_subnet_defined must be true
  #There should be exactly one bastion subnet
  # bastion_subnet_defined = length([for s in var.subnets : true
  #   if s.name == "AzureBastionSubnet"
  # ]) == 1 ? true : false

  bastion_name = var.bastion_host_name == null ? "${var.vnet_name}-bastion" : var.bastion_host_name
}
