data "azurerm_monitor_diagnostic_categories" "diagnostic_categories" {
  resource_id = var.target_resource_id
}

resource "azurerm_monitor_diagnostic_setting" "diagnostic_settings" {
  name                           = var.audit_name
  target_resource_id             = var.target_resource_id
  log_analytics_workspace_id     = var.log_analytics_workspace_id

  dynamic "log" {
    for_each = data.azurerm_monitor_diagnostic_categories.diagnostic_categories.logs

    content {
      category = log.value
      enabled  = true
      retention_policy {
        enabled = false
      }
    }
  }

  dynamic "metric" {
    for_each = data.azurerm_monitor_diagnostic_categories.diagnostic_categories.metrics

    content {
      category = metric.value
      enabled  = true
      retention_policy {
        enabled = false
      }
    }
  }
}