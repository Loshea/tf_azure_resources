# locals {
#   notifications_included = length(var.notifications)
#   valid_notifications    = var.notifications != null ? true : false
#   valid_contact = alltrue([for n in var.notifications :
#     n.contact_emails != null && n.contact_roles != null && n.contact_groups != null
#   ])
# }
