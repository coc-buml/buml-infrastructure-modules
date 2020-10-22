resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "ZRS"
  account_kind             = "StorageV2"
  tags                     = var.tags

  network_rules {
    default_action             = "Deny"
    ip_rules                   = var.static_ip
    virtual_network_subnet_ids = [var.subnet_id]
  }

}


resource "azurerm_storage_container" "core" {
    depends_on = [azurerm_storage_account.storage]
    storage_account_name = var.storage_account_name
    name = var.storage_container_name
    container_access_type = "private"
}

