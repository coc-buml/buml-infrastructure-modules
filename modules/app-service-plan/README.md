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
| location | location of the service | `string` | n/a | yes |
| resource\_group\_name | Name of the azure resource group | `string` | n/a | yes |
| service\_plan\_name | name to give the service-plan | `any` | n/a | yes |
| tags | The tags to associate with your network and subnets. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| service\_plan\_id | n/a |

