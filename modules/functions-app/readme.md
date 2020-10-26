## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |
| null | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| app\_service\_plan\_id | Id of the used service plan of the azure group | `string` | n/a | yes |
| function\_app\_name | Specifies the name of the Function App. Changing this forces a new resource to be created. | `string` | n/a | yes |
| functions\_worker\_runtime | Runtime of the functions e.g. python, node | `string` | n/a | yes |
| insight\_instrumentation\_key | The application insight instrumentation key for the Function | `string` | n/a | yes |
| linux\_fx\_version | Linux App Framework and version for the AppService PYTHON\|3.8, NODE\|12 | `string` | n/a | yes |
| location | location of the service | `string` | n/a | yes |
| resource\_group\_name | The name of the resource group in which to create the Function App. | `string` | n/a | yes |
| storage\_account\_name | Name of the storage account where function.zip will be uploaded | `string` | n/a | yes |
| storage\_primary\_access\_key | Primary Access Key of the storage account where function.zip will be uploaded | `string` | n/a | yes |
| subnet\_name | The name of subnets | `string` | n/a | yes |
| tags | The tags to associate with your network and subnets. | `map(string)` | n/a | yes |
| vnet\_name | The name of vnet created | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| function\_hostname | The default hostname associated with the Function App - such as `mysite.azurewebsites.net` |
| function\_name | The name of the Function App. Changing this forces a new resource to be created. |

