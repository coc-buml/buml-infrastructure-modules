# Cluster Resource Group

module "naming" {
  source  = "Azure/naming/azurerm"
  prefix = [ "buml","dev" ]
}


resource "azurerm_resource_group" "main" {
  name     = module.naming.resource_group.name
  location = var.location
}

# main log workspace 
module "log_analytics" {
  depends_on              = [azurerm_resource_group.main]
  source                  = "../modules/log-analytics"
  log_analytics_name      = "devbumllogmainanalytics"
  resource_group_name     = module.naming.resource_group.name
  location                = var.location

  tags = {
    environment = "dev"
    costcenter  = "it"
  }

}

# VNET
module "network" {
  depends_on          = [azurerm_resource_group.main]
  source              = "../modules/vnet"
  vnet_name           = module.naming.virtual_network.name
  resource_group_name = module.naming.resource_group.name
  location            = var.location
  address_space       = "10.0.0.0/16"
  subnet_prefixes     = ["10.0.0.0/24"]
  subnet_names        = ["main1"]
  service_endpoints   = ["Microsoft.Storage"]
  tags = {
    environment = "dev"
    costcenter  = "it"
  }

}
# vnet audit
module "vnet_diagnostic" {
  depends_on                  = [module.network,module.log_analytics]
  source                      = "../modules/diagnostic-audits"
  audit_name                  = "devbumlvnetaudit"
  target_resource_id          = module.network.vnet_id
  log_analytics_workspace_id  = module.log_analytics.log_analytic_workspace_id
}
  



# Static Website
module "static_website" {
  depends_on              = [module.network]
  source                  = "../modules/static-website"
  storage_account_name    = "bumldevangularapp"
  resource_group_name     = module.naming.resource_group.name
  location                = var.location
  subnet_id               = module.network.vnet_subnets[0]
  static_ip               = ["213.32.231.63"]

  tags = {
    environment = "dev"
    costcenter  = "it"
  }

}

# App Service plan
module "app_service_plan" {
  depends_on              = [azurerm_resource_group.main]
  source                  = "../modules/app-service-plan"
  service_plan_name       = "buml-dev-applications-sp"
  resource_group_name     = module.naming.resource_group.name
  location                = var.location
  tags = {
    environment = "dev"
    costcenter  = "it"
  }

}
# Storage Container for functions
module "storage_account_function" {
  depends_on              = [azurerm_resource_group.main]
  source                  = "../modules/storage-account"
  storage_account_name    = "bumldevfunctionstorage"
  storage_container_name  = "function-releases"
  resource_group_name     = module.naming.resource_group.name
  location                = var.location
  subnet_id               = module.network.vnet_subnets[0]
  static_ip               = ["213.32.231.63"]
  tags = {
    environment = "dev"
    costcenter  = "it"
  }

}

# Application insight module
module "application_insight" {
  depends_on              = [azurerm_resource_group.main]
  source                  = "../modules/application-insight"
  insight_name            = "bumldevinsightfuncproxy"
  resource_group_name     = module.naming.resource_group.name
  location                = var.location
  application_type        = "other"
  tags = {
    environment = "dev"
    costcenter  = "it"
  }

}

# Azure function 
module "azure_function" {
  depends_on                  = [azurerm_resource_group.main,module.storage_account_function,module.app_service_plan,module.application_insight]
  source                      = "../modules/functions-app"
  function_app_name           = "bumldevfunctionsproxy"
  location                    = var.location
  resource_group_name         = module.naming.resource_group.name
  app_service_plan_id         = module.app_service_plan.service_plan_id
  storage_account_name        = module.storage_account_function.storage_account_name
  storage_primary_access_key  = module.storage_account_function.storage_primary_access_key
  linux_fx_version            = "Python|3.8"
  vnet_name                   = module.network.vnet_name
  subnet_name                 = module.network.vnet_subnets_name[0]
  

  app_settings = {
    FUNCTIONS_WORKER_RUNTIME = "python"
		APPINSIGHTS_INSTRUMENTATIONKEY = module.application_insight.insight_instrumentation_key
  }

  tags = {
    environment = "dev"
    costcenter  = "it"
  }

}



# api management resource
module "api_management" {
  depends_on              = [azurerm_resource_group.main,module.application_insight]
  source                  = "../modules/api-management"
  apim_name               = "bumldevapim"
  api_name                = "bumldevapplication"
  api_path                = "application"
  resource_group_name     = module.naming.resource_group.name
  location                = var.location
  publisher_name          = "Philipp Schmid"
  publisher_email         = "Philipp.Schmid@codecamp-n.com"
  application_insights_instrumentation_key = module.application_insight.insight_instrumentation_key
  tags = {
    environment = "dev"
    costcenter  = "it"
  }

}

# Key Vault
module "key-vault" {
  depends_on              = [azurerm_resource_group.main]
  source                  = "../modules/key-vault"
  resource_group_name     = module.naming.resource_group.name
  location                = var.location
  key_vault_name          = "buml-module-test-vault"

  tags = {
    environment = "dev"
    costcenter  = "it"
  }
}
