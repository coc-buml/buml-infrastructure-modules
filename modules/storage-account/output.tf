
output "primary_connection_string" {
  description = "The connection string associated with the primary location."
  value       = azurerm_storage_account.storage.primary_connection_string
}

output "storage_primary_access_key" {
  description = "The primary access key for the storage account."
  value       = azurerm_storage_account.storage.primary_access_keyn
}

output "storage_account_name" {
  description = "The name of the storage account. "
  value       = azurerm_storage_account.storage.name
}



