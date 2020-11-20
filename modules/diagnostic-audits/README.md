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
| audit\_name | name to give the diagnostic audits | `string` | n/a | yes |
| log\_analytics\_workspace\_id | the id of the log analytics workspace | `string` | n/a | yes |
| target\_resource\_id | id of the target resource | `string` | n/a | yes |

## Outputs

No output.

