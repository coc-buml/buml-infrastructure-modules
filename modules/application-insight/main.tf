resource "azurerm_application_insights" "core" {
  name                = var.insight_name
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = var.application_type
}