# Terraform modules for the BUML infrastructure

# Modules included

| Service             | Documentation                                                  | Module-URL                                                                                        |
| ------------------- | -------------------------------------------------------------- | ------------------------------------------------------------------------------------------------- |
| VNET                | [vnet](./modules/vnet/README.md)                               | `'https://github.com/coc-buml/buml-infrastructure-modules/tree/main/modules/vnet'`                |
| App Service Plan    | [App Service Plan ](./modules/app-service-plan/README.md)      | `'https://github.com/coc-buml/buml-infrastructure-modules/tree/main/modules/app-service-plan'`    |
| application-insight | [Application Insight](./modules/application-insight/README.md) | `'https://github.com/coc-buml/buml-infrastructure-modules/tree/main/modules/application-insight'` |
| function-app        | [Function App](./modules/function-app/README.md)               | `'https://github.com/coc-buml/buml-infrastructure-modules/tree/main/modules/functions_app'`       |
| static-website      | [Static Website](./modules/static-website/README.md)           | `'https://github.com/coc-buml/buml-infrastructure-modules/tree/main/modules/static-website'`      |
| storage-account     | [Storage Account](./modules/storage-account/README.md)         | `'https://github.com/coc-buml/buml-infrastructure-modules/tree/main/modules/storage-account'`     |

# Generate Documentation

befor you can run it you have to change directory into the module, where you want to generate the documentation.

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
