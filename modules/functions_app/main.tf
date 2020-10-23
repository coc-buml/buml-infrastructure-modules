resource "azurerm_function_app" "core" {
  name                       = var.function_app_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  app_service_plan_id        = var.app_service_plan_id
  storage_account_name       = var.storage_account_name
  storage_account_access_key = var.storage_primary_access_key
  version                    = "~3"
  os_type                    = "linux"
  https_only                 = true


  site_config {
    linux_fx_version = var.linux_fx_version
    use_32_bit_worker_process = false
  }

  identity {
    type = "SystemAssigned"
  }

  app_settings = {
    FUNCTIONS_WORKER_RUNTIME = var.functions_worker_runtime
		APPINSIGHTS_INSTRUMENTATIONKEY = var.insight_instrumentation_key
  }
  
}