# Terraform modules for the BUML infrastructure

# Modules included

| Service | Module-URL         | Ref |
| ------- | ------------------ | --- |
| VNET    | `'github.com....'` |     |
|         |                    |     |
|         |                    |     |

## Ressources

- [public azure terraform module list](https://registry.terraform.io/search/modules)

## Externalen Modules

- https://github.com/Azure/terraform-azurerm-naming
- https://registry.terraform.io/modules/Azure/naming/azurerm/latest -> wait for repsonse from uli to implement
- key vault -> https://github.com/claranet/terraform-azurerm-keyvault

## Getting started

- Set up Azure storage to store Terraform state
- Create the Kubernetes cluster

```
terraform init
terraform validate
terraform plan
terraform apply
```
