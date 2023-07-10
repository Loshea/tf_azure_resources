# locals {
#   notifications_included = length(var.notifications)
#   valid_notifications    = var.notifications != null ? true : false
#   valid_contact = [for n in var.notifications :
#     {
#       value = n.contact_emails != null && n.contact_roles != null && n.contact_groups != null ? true : false
#   }]
# }
