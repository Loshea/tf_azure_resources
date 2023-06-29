# $Azure Terraform Resources

This project contains Terraform modules for working with Azure resources.  Each module is written to include components for various analytics.  Modules are intended to be instantiated using an array of structures, so that each module need only be called one time.

## Installation
Create your module in main.tf and list the source as git:
```
module "<resource type>" {
    source = "git::https://github.com/Loshea/tf_azure_resources.git/modules/<resource type>"
}
```
