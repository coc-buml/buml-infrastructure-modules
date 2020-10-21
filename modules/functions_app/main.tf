resource "azurerm_function_app" "core" {
  name                       = local.app_name
  location                   = azurerm_resource_group.core.location
  resource_group_name        = azurerm_resource_group.core.name
  app_service_plan_id        = azurerm_app_service_plan.core.id
  storage_account_name       = azurerm_storage_account.function.name
  storage_account_access_key = azurerm_storage_account.function.primary_access_key
  version                    = "~3"
  os_type                    = "linux"

  site_config {
    linux_fx_version = "PYTHON|3.8"
    use_32_bit_worker_process = false
  }

  identity {
    type = "SystemAssigned"
  }

  app_settings = {
    FUNCTIONS_WORKER_RUNTIME = "python"
		APPINSIGHTS_INSTRUMENTATIONKEY = "${azurerm_application_insights.test.instrumentation_key}"
  }}