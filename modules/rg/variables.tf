variable "rg_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Location in whcih to place the resource group"
}

variable "create_costview" {
  type        = bool
  description = "Enable a cost management view for this resource group"
  default     = true
}

variable "create_budget" {
  type        = bool
  description = "Create a spend budget for the resource group"
  default     = false
}

variable "budget_amount" {
  type        = number
  description = "Budget ammount for this resource group"
  default     = 0
}


variable "filter_dimensions" {
  type = set(object({
    name   = string
    values = list(string)
  }))
  default     = []
  description = "Budget filter dimensions"
}

variable "filter_tags" {
  type = set(object({
    tag_name   = string
    tag_values = list(string)
  }))
  description = "Tags to filter by in the budget"
  default     = []
}

variable "budget_start_date" {
  type        = string
  description = "Budget Start Date ( YYYY-mm-ddTHH:MM:SSZ)"
}

variable "budget_end_date" {
  type        = string
  description = "Budget End Date ( YYYY-mm-ddTHH:MM:SSZ) OPTIONAL"
  default     = null
}

variable "notifications" {
  type = set(object({
    enabled        = bool
    threshold      = number
    operator       = string
    contact_emails = list(string)
    contact_roles  = list(string)
    contact_groups = list(string)
  }))
  description = "List of notification thresholds and targets"
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to the resource group"
  default     = {}
}
