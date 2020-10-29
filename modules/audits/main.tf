resource "azurerm_monitor_diagnostic_setting" "core" {
  name               = var.diagnostic_name
  target_resource_id = azurerm_virtual_network.vnet.id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  log = var.log
  metric = var.metric
}
  