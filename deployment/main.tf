# Cluster Resource Group

resource "azurerm_resource_group" "aks" {
  name     = var.resource_group_name
  location = var.location
}

# VNET
module "network" {
  depends_on = [azurerm_resource_group.example]
  source              = "../modules/vnet"
  resource_group_name = var.resource_group_name
  location             = var.location
  address_space       = "10.0.0.0/16"
  subnet_prefixes     = ["10.0.0.0/24"]
  subnet_names        = ["subnet1"]

  tags = {
    environment = "dev"
    costcenter  = "it"
  }

}