variable "rg_id" {
  type        = string
  description = "ID of the resource group to attach the budget to"
}

variable "budget_name" {
  type        = string
  description = "Name of the budget to attach to the resource group"

}
variable "time_grain" {
  type        = string
  description = "The time-granularity of the budget.  Default:  Monthly"
  default     = "Monthly"
  validation {
    condition = anytrue([
      var.time_grain == "Monthly",
      var.time_grain == "BillingAnnual",
      var.time_grain == "BillingMonth",
      var.time_grain == "BillingQuarter",
      var.time_grain == "Annually",
      var.time_grain == "Quarterly"
    ])
    error_message = "Invalid time_grain.  Must be one of [BillingAnnual|BillingMonth|BillingQuarter|Monthly|Quarterly|Annually]"
  }

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

variable "budget_amount" {
  type        = number
  description = "Budget ammount for this resource group"
  default     = 0
}

variable "budget_start_date" {
  type        = string
  description = "Budget Start Date ( YYYY-MM-DDThh:mm:ssZ).  Date must not be prior to the beginning of this month."
  #TODO:  Write data stamp validator
}

variable "budget_end_date" {
  type        = string
  description = "Budget End Date ( YYYY-MM-DDThh:mm:ssZ) OPTIONAL"
  default     = null
  #TODO:  Write data stamp validator
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
  default = [{
    enabled        = true
    threshold      = 0
    operator       = ""
    contact_emails = []
    contact_roles  = []
    contact_groups = []
  }]
  #TODO: Add validator for operator and threshold
}
