resource "azurerm_storage_account" "static_website" {
  name                = var.storage_account_name
  resource_group_name = var.resource_group_name

  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "ZRS"
  account_kind             = "StorageV2"

  network_rules {
    default_action             = "Deny"
    ip_rules                   = [var.static_ip]
    virtual_network_subnet_ids = [var.subnet_id]
  }

  static_website {
    index_document = "index.html"
    error_404_document= "index.html"
  }
  tags                = var.tags

}