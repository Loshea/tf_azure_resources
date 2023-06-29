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

variable "budget_start_date" {
  type        = string
  description = "Budget Start Date ( YYYY-mm-ddTHH:MM:SSZ)"
  default     = "2023-06-01T00:00:00Z"
}

variable "budget_end_date" {
  type        = string
  description = "Budget End Date ( YYYY-mm-ddTHH:MM:SSZ) OPTIONAL"
  default     = null
}

variable "notification_contact_emails" {
  type        = list(any)
  description = "List of email addresses to notify"
}
