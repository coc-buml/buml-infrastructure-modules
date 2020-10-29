

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = [var.address_space]
  dns_servers         = var.dns_servers
  tags                = var.tags
}

resource "azurerm_subnet" "subnet" {
  count                = length(var.subnet_names)
  name                 = var.subnet_names[count.index]
  resource_group_name  = var.resource_group_name
  address_prefixes     = [var.subnet_prefixes[count.index]]
  virtual_network_name = azurerm_virtual_network.vnet.name
  service_endpoints    = var.service_endpoints
}

resource "azurerm_monitor_diagnostic_setting" "frontend_application" {
  depends_on        = [azurerm_log_analytics_workspace.frontend_application]
  name               = "${var.app_name}-${var.environment}-${local.random_key}"
  target_resource_id = azurerm_cdn_endpoint.frontend_application.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.frontend_application.id