
output "primary_connection_string" {
  description = "The connection string associated with the primary location."
  value       = azurerm_storage_account.storage.primary_connection_string
}

