## Requirements

| Name      | Version |
| --------- | ------- |
| terraform | >= 0.13 |

## Providers

| Name    | Version |
| ------- | ------- |
| azurerm | n/a     |

## Inputs

| Name                     | Description                           | Type           | Default | Required |
| ------------------------ | ------------------------------------- | -------------- | ------- | :------: |
| name                     | name to give to alert + logic app     | `string`       | n/a     |   yes    |
| resource_group_name      | Name of the azure resource group      | `string`       | n/a     |   yes    |
| resources_to_monitor_ids | ids of the azure functions to monitor | `list(string)` | n/a     |   yes    |

## Outputs

No output.
