## Requirements

| Name      | Version |
| --------- | ------- |
| terraform | >= 0.13 |

## Providers

| Name    | Version |
| ------- | ------- |
| azurerm | n/a     |
| null    | n/a     |

## Inputs

| Name                       | Description                                                                                | Type                                                                 | Default | Required |
| -------------------------- | ------------------------------------------------------------------------------------------ | -------------------------------------------------------------------- | ------- | :------: |
| app_service_plan_id        | Id of the used service plan of the azure group                                             | `string`                                                             | n/a     |   yes    |
| app_settings               | The appsettings to associate with your azure functions.                                    | `map(string)`                                                        | n/a     |   yes    |
| function_app_name          | Specifies the name of the Function App. Changing this forces a new resource to be created. | `string`                                                             | n/a     |   yes    |
| linux_fx_version           | Linux App Framework and version for the AppService PYTHON\|3.8, NODE\|12                   | `string`                                                             | n/a     |   yes    |
| location                   | location of the service                                                                    | `string`                                                             | n/a     |   yes    |
| resource_group_name        | The name of the resource group in which to create the Function App.                        | `string`                                                             | n/a     |   yes    |
| storage_account_name       | Name of the storage account where function.zip will be uploaded                            | `string`                                                             | n/a     |   yes    |
| storage_primary_access_key | Primary Access Key of the storage account where function.zip will be uploaded              | `string`                                                             | n/a     |   yes    |
| subnet_name                | The name of subnets                                                                        | `string`                                                             | n/a     |   yes    |
| tags                       | The tags to associate with your network and subnets.                                       | `map(string)`                                                        | n/a     |   yes    |
| cors                       | CORS Attribute for allowing cross domain access to the function app                        | `object({allowed_origins: list(string), support_credentials: bool})` | null    |    no    |
| vnet_name                  | The name of vnet created                                                                   | `string`                                                             | n/a     |   yes    |

## Outputs

| Name              | Description                                                                                |
| ----------------- | ------------------------------------------------------------------------------------------ |
| function_hostname | The default hostname associated with the Function App - such as `mysite.azurewebsites.net` |
| function_name     | The name of the Function App. Changing this forces a new resource to be created.           |
