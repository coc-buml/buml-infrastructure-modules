# Terraform modules for the BUML infrastructure

# Modules included

| Service             | Documentation                                   | Module-URL         |
| ------------------- | ----------------------------------------------- | ------------------ |
| VNET                | [vnet](./modules/vnet/README.md)                | `'github.com....'` |
| App Service Plan    | [vnet](./modules/app-service-plan/README.md)    | `'github.com....'` |
| application-insight | [vnet](./modules/application-insight/README.md) | `'github.com....'` |
| function_app        | [vnet](./modules/function_app/README.md)        | `'github.com....'` |
| static-website      | [vnet](./modules/static-website/README.md)      | `'github.com....'` |
| storage-account     | [vnet](./modules/storage-account/README.md)     | `'github.com....'` |

# Generate Documentation

```bash
docker run --rm -v $(pwd):/data cytopia/terraform-docs terraform-docs md . > README.md
```

## Ressources

- [public azure terraform module list](https://registry.terraform.io/search/modules)

## Externalen Modules

- https://github.com/Azure/terraform-azurerm-naming
- https://registry.terraform.io/modules/Azure/naming/azurerm/latest -> wait for repsonse from uli to implement
- key vault -> https://github.com/claranet/terraform-azurerm-keyvault

## Getting started

```
cd deployment
terraform init
terraform validate
terraform plan
terraform apply
```
