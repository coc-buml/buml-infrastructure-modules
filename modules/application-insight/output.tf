output "insight_instrumentation_key" {
  description = "The Instrumentation Key for this Application Insights component."
  value = azurerm_application_insights.core.instrumentation_key
}

output "insight_app_id" {
  description = "The App ID associated with this Application Insights component."
  value = azurerm_application_insights.core.app_id
}