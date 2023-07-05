# Azure Terraform Resources

This project contains Terraform modules for working with Azure resources.  Each module is written to include components for various analytics and diagnostics.  This is very much a work in progress.

## Installation
Create your module in main.tf and list the source as git:
```
module "<resource type>" {
    source = "git::https://github.com/Loshea/tf_azure_resources.git/modules/<resource type>"
}
```


# Usage
The following Azure RM resources are available in this project:


1. [Azure Kubernetes Cluster](modules/aks/README.md)
2. [Resource Group](#Resource-Group)

## Resource Group
