resource "azurerm_app_service_plan" "service_plan" {
  name                = var.service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = "Linux"
  tags                = var.tags
  reserved            = true
  sku {
    tier = "Premium"
    size = "EP1"
  }
}