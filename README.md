# Terraform modules for the BUML infrastructure

# Modules included

| Service             | Documentation                                                  | Module-URL                                                                                |
| ------------------- | -------------------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| VNET                | [vnet](./modules/vnet/README.md)                               | `"git@github.com/coc-buml/buml-infrastructure-modules.git//modules/vnet"`                 |
| App Service Plan    | [App Service Plan ](./modules/app-service-plan/README.md)      | `"git@github.com/coc-buml/buml-infrastructure-modules.git//modules/app-service-plan"`     |
| application-insight | [Application Insight](./modules/application-insight/README.md) | `""git@github.com/coc-buml/buml-infrastructure-modules.git//modules/application-insight"` |
| function-app        | [Function App](./modules/function-app/README.md)               | `"git@github.com/coc-buml/buml-infrastructure-modules.git//modules/functions-app"`        |
| static-website      | [Static Website](./modules/static-website/README.md)           | `"git@github.com/coc-buml/buml-infrastructure-modules.git//modules/static-website"`       |
| storage-account     | [Storage Account](./modules/storage-account/README.md)         | `"git@github.com/coc-buml/buml-infrastructure-modules.git//modules/storage-account"`      |
| log-analytics       | [Log Analytics](./modules/log-analytics/README.md)             | `"git@github.com/coc-buml/buml-infrastructure-modules.git//modules/log-analytics"`        |
| diagnostic-audits   | [Diagnostic Audits](./modules/diagnostic-audits/README.md)     | `"git@github.com/coc-buml/buml-infrastructure-modules.git//modules/diagnostic-audits"`    |
| api-management      | [Api Management](./modules/api-management/README.md)           | `"git@github.com/coc-buml/buml-infrastructure-modules.git//modules/api-management"`       |

# Generate Documentation

befor you can run it you have to change directory into the module, where you want to generate the documentation.

```bash
docker run --rm -v $(pwd):/data cytopia/terraform-docs terraform-docs md . > README.md
```

**Merge Maps**

```terraform
  app_settings = merge(
    local.default_application_settings,
    var.function_app_application_settings,
  )
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
