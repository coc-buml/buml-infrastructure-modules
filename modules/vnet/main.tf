
resource "azurerm_virtual_network" "vnet" {
  depends_on = [azurerm_network_ddos_protection_plan.buml_ddos_protection]
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = [var.address_space]
  dns_servers         = var.dns_servers
  tags                = var.tags

  /*
    Secure the Azure VNET behind a ddos plan
  */
  ddos_protection_plan {
    id     = azurerm_network_ddos_protection_plan.buml_ddos_protection.id
    enable = true
  }
}

resource "azurerm_subnet" "subnet" {
  count                = length(var.subnet_names)
  name                 = var.subnet_names[count.index]
  resource_group_name  = var.resource_group_name
  address_prefixes     = [var.subnet_prefixes[count.index]]
  virtual_network_name = azurerm_virtual_network.vnet.name
  service_endpoints    = var.service_endpoints
  delegation {
    name = "delegation"
    service_delegation {
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/action",
      ]
      name = "Microsoft.Web/serverFarms"
    }
  }
}

/*
  Link to Ressoruces: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_ddos_protection_plan
  We need a DDoS-Protection to fulfill the regulations
*/
resource "azurerm_network_ddos_protection_plan" "buml_ddos_protection" {
  name                = "buml-ddos-protection-plan-${var.location}"
  location            = azurerm_resource_group.example.location
  resource_group_name = var.location
  tags                = var.tags
}
