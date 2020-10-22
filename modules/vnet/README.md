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
| address\_space | The address space that is used by the virtual network. | `string` | `"10.0.0.0/16"` | no |
| dns\_servers | The DNS servers to be used with vNet. | `list(string)` | `[]` | no |
| location | location of the service | `string` | n/a | yes |
| resource\_group\_name | The name of an existing resource group to be imported. | `string` | n/a | yes |
| service\_endpoints | A list of public service endpoints inside the subnet. | `list(string)` | n/a | yes |
| subnet\_names | A list of public subnets inside the vNet. | `list(string)` | <pre>[<br>  "subnet1"<br>]</pre> | no |
| subnet\_prefixes | The address prefix to use for the subnet. | `list(string)` | <pre>[<br>  "10.0.1.0/24"<br>]</pre> | no |
| tags | The tags to associate with your network and subnets. | `map(string)` | n/a | yes |
| vnet\_name | Name of the vnet to create. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| vnet\_address\_space | The address space of the newly created vNet |
| vnet\_id | The id of the newly created vNet |
| vnet\_location | The location of the newly created vNet |
| vnet\_name | The Name of the newly created vNet |
| vnet\_subnets | The ids of subnets created inside the newl vNet |

