resource "azurerm_log_analytics_workspace" "core" {
  name                = var.log_analytics_name
  location            = var.location
  resource_group_name = var.resource_group_name
  retention_in_days   = 30
  tags                = var.tags
}