resource "azurerm_app_service_plan" "service_plan" {
  name                = var.service_plan_name
  location            = var.location
  resource_group_name = var.resource_group_name
  kind                = "elastic"
  tags                = var.tags
  reserved            = true


  
  sku {
    tier = "ElasticPremium"
    size = "EP1"
  }
}
