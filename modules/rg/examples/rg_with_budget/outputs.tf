output "rg_name" {
  value       = module.rg1.rg_name
  description = "Name of the resource group"
}

output "location" {
  value       = module.rg1.location
  description = "Location the new resource group was created in"
}

output "budget_name" {
  value       = module.rg1.budget_name
  description = "Name of the budget associated with the resource grouo"
}
