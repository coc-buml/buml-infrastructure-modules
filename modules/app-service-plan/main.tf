resource "azurerm_app_service_plan" "service_plan" {
  name                = var.service_plan_name
  name                = var.storage_account_name
  resource_group_name = var.resource_group_name
  kind                = "Linux"
  tags                = var.tags
  
  sku {
    tier = "Premium"
    size = "P1V2"
  }
}