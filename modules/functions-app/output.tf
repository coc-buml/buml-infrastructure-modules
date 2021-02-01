output "function_hostname" {
  description = "The default hostname associated with the Function App - such as `mysite.azurewebsites.net`"
  value = azurerm_function_app.core.default_hostname
}

output "function_name" {
  description = "The name of the Function App. Changing this forces a new resource to be created."
  value = azurerm_function_app.core.name
}

output "function_id" {
  description = "The id of the Function App."
  value = azurerm_function_app.core.id
}
