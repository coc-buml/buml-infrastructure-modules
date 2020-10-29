# Audit is no module because of its unique attribute for each ressource


resource "azurerm_monitor_diagnostic_setting" "core" {
  name               = "devbumlvnetaudit"
  target_resource_id = module.network.vnet_id
  log_analytics_workspace_id = module.log_analytics.log_analytics_workspace_id
  log  {
    category = "VMProtectionAlerts"
    enabled  = true
  }
  metric  {
    category = "AllMetrics"

    retention_policy {
      enabled = false
    }
  }

}