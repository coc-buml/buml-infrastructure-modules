output "primary_web_endpoint" {
  description = "The endpoint URL for web storage in the primary location."
  value       = azurerm_storage_account.static_website.primary_web_endpoint
}

output "primary_web_host" {
  description = "The hostname with port if applicable for web storage in the primary location."
  value       = azurerm_storage_account.static_website.primary_web_host
}

