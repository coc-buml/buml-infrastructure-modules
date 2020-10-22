# Cluster Resource Group

module "naming" {
  source  = "Azure/naming/azurerm"
  prefix = [ "buml","dev" ]
}


resource "azurerm_resource_group" "main" {
  name     = module.naming.resource_group.name
  location = var.location
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

# Static Website
module "static_website" {
  depends_on              = [module.network]
  source                  = "../modules/static-website"
  storage_account_name    = module.naming.storage_account.name_unique
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
  service_plan_name       = "buml-dev-application-sp"
  resource_group_name     = module.naming.resource_group.name
  location                = var.location
  tags = {
    environment = "dev"
    costcenter  = "it"
  }

}
# Storage Container
module "storage_account_function" {
  depends_on              = [azurerm_resource_group.main]
  source                  = "../modules/storage-account"
  storage_account_name    = "bumldevfunctionstorage"
  storage_container_name  = module.naming.storage_container.name_unique
  resource_group_name     = module.naming.resource_group.name
  location                = var.location
  subnet_id               = module.network.vnet_subnets[0]
  static_ip               = ["213.32.231.63"]
  tags = {
    environment = "dev"
    costcenter  = "it"
  }

}