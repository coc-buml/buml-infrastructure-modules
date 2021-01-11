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
| key\_vault\_name | Specifies the name of the Key Vault. Changing this forces a new resource to be created. | `string` | n/a | yes |
| location | location of the service | `string` | n/a | yes |
| resource\_group\_name | Name of the azure resource group | `string` | n/a | yes |
| tags | The tags to associate with your network and subnets. | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| key\_vault\_id | The ID of the Key Vault. |
