# What do we need ? 
# 1. Alert rule -> 4xx is greater or equal 1 
# 1. b metric Alert Condition
# 2. Alert Action -> HTTP Call logic app
# ressources https://docs.microsoft.com/de-de/azure/azure-monitor/platform/metrics-supported#microsoftappplatformspring

# Alert -> connects with AZ ressource
resource "azurerm_monitor_metric_alert" "core" {
 depends_on          = [azurerm_template_deployment.logic_app]
  name                = var.name
  resource_group_name = var.resource_group_name
  scopes              = var.resources_to_monitor_ids #[azurerm_storage_account.to_monitor.id]
  description         = "Action will be triggered when either 4XX or 500 errors accure in the provided azure functions."

  criteria {
    metric_namespace = "Microsoft.Web/sites"
    metric_name      = "Http4xx"
    aggregation      = "Total"
    operator         = "GreaterThanOrEqual"
    threshold        = 1
  }
  criteria {
    metric_namespace = "Microsoft.Web/sites"
    metric_name      = "Http5xx"
    aggregation      = "Total"
    operator         = "GreaterThanOrEqual"
    threshold        = 1
  }


  action {
    action_group_id = azurerm_monitor_action_group.main.id
  }
}


# split(split(items('For_each'),'sites/')[1],'/')[0]
resource "azurerm_monitor_action_group" "main" {
  depends_on          = [azurerm_template_deployment.logic_app]
  name                = "${var.name}-actiongroup"
  resource_group_name = var.resource_group_name
  short_name          = "LTM"

  logic_app_receiver {
    name                    = "logicappaction"
    resource_id             =  azurerm_template_deployment.logic_app.outputs["resourceId"]
    callback_url            =  replace(azurerm_template_deployment.logic_app.outputs["logicAppUrl"],"%2F","/")
    use_common_alert_schema = true
  }
}
resource "azurerm_template_deployment" "logic_app" {
  name                = "${var.name}-alert-notification"
  resource_group_name = var.resource_group_name
  template_body       = <<DEPLOY
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "parameters": {},
  "variables": {
  },
  "resources": [
    {
      "type": "Microsoft.Logic/workflows",
      "apiVersion": "2019-05-01",
      "name": "${var.name}-alert-notification",
      "location": "${var.location}",
      "tags": {},
      "properties": {
            "definition": {
                "$schema": "https://schema.management.azure.com/providers/Microsoft.Logic/schemas/2016-06-01/workflowdefinition.json#",
                "actions": {
                    "For_each": {
                        "actions": {
                            "HTTP": {
                                "inputs": {
                                    "body": {
                                        "sections": [
                                            {
                                                "activityImage": "https://teamsnodesample.azurewebsites.net/static/img/image1.png",
                                                "activitySubtitle": "at @{triggerBody()?['data']?['essentials']?['firedDateTime']}",
                                                "activityTitle": "@{triggerBody()?['data']?['essentials']?['alertRule']}",
                                                "facts": [
                                                    {
                                                        "name": "ressource group",
                                                        "value": "@{split(split(items('For_each'),'resourcegroups/')[1],'/')[0]}"
                                                    },
                                                    {
                                                        "name": "Service",
                                                        "value": "@{split(split(items('For_each'),'sites/')[1],'/')[0]}"
                                                    },
                                                    {
                                                        "name": "subscription",
                                                        "value": "@{split(split(items('For_each'),'subscriptions/')[1],'/')[0]}"
                                                    }
                                                ],
                                                "markdown": true
                                            }
                                        ],
                                        "summary": "FEHLER",
                                        "themeColor": "#ff0033"
                                    },
                                    "headers": {
                                        "Content-Type": "application/json"
                                    },
                                    "method": "POST",
                                    "uri": "@parameters('teamshook')"
                                },
                                "runAfter": {},
                                "type": "Http"
                            }
                        },
                        "foreach": "@triggerBody()?['data']?['essentials']?['alertTargetIDs']",
                        "runAfter": {},
                        "type": "Foreach"
                    }
                },
                "contentVersion": "1.0.0.0",
                "outputs": {},
                "parameters": {
                    "teamshook": {
                        "defaultValue": "https://codecampn.webhook.office.com/webhookb2/b23d29ec-e3f3-4ba5-8763-8f59fd47727c@4e487871-b21c-4965-9b9b-a60470050f7c/IncomingWebhook/cc6110563e4f40a69daf7fc488261518/dc89140c-d26f-4fc6-8602-a6e4b6f9fc57",
                        "type": "String"
                    }
                },
                "triggers": {
                    "request": {
                        "inputs": {
                            "method": "POST",
                            "schema": {
                                "properties": {
                                    "data": {
                                        "properties": {
                                            "alertContext": {
                                                "properties": {},
                                                "type": "object"
                                            },
                                            "essentials": {
                                                "properties": {
                                                    "alertContextVersion": {
                                                        "type": "string"
                                                    },
                                                    "alertId": {
                                                        "type": "string"
                                                    },
                                                    "alertRule": {
                                                        "type": "string"
                                                    },
                                                    "alertTargetIDs": {
                                                        "items": {
                                                            "type": "string"
                                                        },
                                                        "type": "array"
                                                    },
                                                    "description": {
                                                        "type": "string"
                                                    },
                                                    "essentialsVersion": {
                                                        "type": "string"
                                                    },
                                                    "firedDateTime": {
                                                        "type": "string"
                                                    },
                                                    "monitorCondition": {
                                                        "type": "string"
                                                    },
                                                    "monitoringService": {
                                                        "type": "string"
                                                    },
                                                    "originAlertId": {
                                                        "type": "string"
                                                    },
                                                    "resolvedDateTime": {
                                                        "type": "string"
                                                    },
                                                    "severity": {
                                                        "type": "string"
                                                    },
                                                    "signalType": {
                                                        "type": "string"
                                                    }
                                                },
                                                "type": "object"
                                            }
                                        },
                                        "type": "object"
                                    },
                                    "schemaId": {
                                        "type": "string"
                                    }
                                },
                                "type": "object"
                            }
                        },
                        "kind": "Http",
                        "type": "Request"
                    }
                }
            },
            "parameters": {}
        }
      }
  ],
  "outputs": {
   "logicAppUrl": {
      "type": "string",
      "value": "[listCallbackURL(concat(resourceId('Microsoft.Logic/workflows/', '${var.name}-alert-notification'), '/triggers/manual'), '2016-06-01').value]"
   },
    "resourceId": {
        "type": "string",
        "value": "resourceId('Microsoft.Logic/workflows/', '${var.name}-alert-notification')"
    }
  }
}
DEPLOY

    deployment_mode     = "Incremental"
}
