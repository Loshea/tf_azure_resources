# create_bastion_override_host_name

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.4 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~>3.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_rg1"></a> [rg1](#module\_rg1) | git::https://github.com/Loshea/tf_azure_resources.git//modules/rg | v0.12.0 |
| <a name="module_vnet"></a> [vnet](#module\_vnet) | ../../ | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bastion_host_ip"></a> [bastion\_host\_ip](#output\_bastion\_host\_ip) | IP Address of the bastion host |
| <a name="output_bastion_host_name"></a> [bastion\_host\_name](#output\_bastion\_host\_name) | Bastion Host Public IP Address |
| <a name="output_subnets"></a> [subnets](#output\_subnets) | List of subnets created in the Virtual Network |
| <a name="output_vnet_id"></a> [vnet\_id](#output\_vnet\_id) | ID of the new Virtual Network |
| <a name="output_vnet_name"></a> [vnet\_name](#output\_vnet\_name) | Name of the new Virtual Network |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
