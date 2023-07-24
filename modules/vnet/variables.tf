variable "vnet_name" {
  type        = string
  description = "Name of the new vnet"
}

variable "rg_name" {
  type        = string
  description = "Resource group containing this virtual network"
}

variable "location" {
  type        = string
  description = "Regoin to locate the virtual network in"
}

variable "address_space" {
  type        = list(string)
  description = "The list of address spaces contained within the network"
}

variable "dns_servers" {
  type        = list(string)
  description = "(Optional)DNS Servers servicing this network"
  default     = []
}
variable "ddos_protection_plan" {
  type = object({
    id     = string
    enable = bool
  })
  description = "(Optional)DDOS Protection Plan id and enable state"
  default = {
    id     = null
    enable = false
  }
}

variable "subnets" {
  type = set(object({
    name           = string
    address_prefix = string
    security_group = string
  }))
  description = "The list of subnets contained within the network, and their associated NSGs, if any."
  # TODO: Come back to validation.  While it might be nice to catch this during
  # the validation pass, the regex is going to be long and ugly to do it right.
  # As it stands, this would valiate 300.1.1.1/16
  # validation {
  #   condition = length([
  #     for s in var.subnets : true
  #     if can(regex("^([0-9]{1,3}\\.){3}[0-9]{1,3}(\\/([0-9]|[1-2][0-9]|3[0-2]))?$",s.address_prifix))
  #   ]) == length(var.subnets)
  #   error_message = "Invalid subnet address_prefix.  The subnet address_prefix must be in the form xxx.xxx.xxx.xxx./yy "
  # }
}

variable "tags" {
  type        = map(string)
  description = "(Optional)Tags to apply to the virtual network"
  default     = {}
}

#TODO: Move to locals and set to true if can(var.bastion_host_name)
variable "enable_bastion" {
  type        = bool
  description = "Enable a bastion on this vnet.  Default: false"
  default     = false
}

variable "bastion_host_name" {
  type        = string
  description = "(Optional)Name to give to the VNet's Bastion Host.  Setting this value triggers the creation of the VNet's Bastion Host"
  default     = null
}
