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
| static\_ip | A list of static ip address to access the bucket | `list(string)` | n/a | yes |
| storage\_account\_name | Name of the storage to create. | `string` | n/a | yes |
| subnet\_id | subnet\_id of the subnet in which the satic website will be placed | `string` | n/a | yes |
| tags | The tags to associate with your network and subnets. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| primary\_web\_endpoint | The endpoint URL for web storage in the primary location. |
| primary\_web\_host | The hostname with port if applicable for web storage in the primary location. |

