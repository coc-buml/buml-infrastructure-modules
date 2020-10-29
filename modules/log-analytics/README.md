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
| log\_analytics\_name | name to give the log analytics workspace | `string` | n/a | yes |
| resource\_group\_name | Name of the azure resource group | `string` | n/a | yes |
| tags | The tags to associate with your network and subnets. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| log\_analytic\_primary\_key | The Primary shared key for the Log Analytics Workspace. |
| log\_analytic\_workspace\_id | The Workspace (or Customer) ID for the Log Analytics Workspace. |

