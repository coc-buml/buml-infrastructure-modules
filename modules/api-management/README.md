## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| api\_name | The name of the API Management API. Changing this forces a new resource to be created. | `string` | n/a | yes |
| api\_path | The Path for this API Management API, which is a relative URL which uniquely identifies this API and all of its resource paths within the API Management Service. | `string` | n/a | yes |
| apim\_name | The name of the API Management Service. Changing this forces a new resource to be created. | `string` | n/a | yes |
| application\_insights\_instrumentation\_key | The Instrumentation key of the application insight | `string` | n/a | yes |
| location | The Azure location where the API Management Service exists. Changing this forces a new resource to be created. | `string` | n/a | yes |
| publisher\_email | The email of publisher/company. | `string` | n/a | yes |
| publisher\_name | The name of publisher/company. | `string` | n/a | yes |
| resource\_group\_name | The name of the Resource Group in which the API Management Service should be exist. Changing this forces a new resource to be created. | `string` | n/a | yes |
| tags | The tags to associate with your network and subnets. | `map(string)` | n/a | yes |

## Outputs

No output.

