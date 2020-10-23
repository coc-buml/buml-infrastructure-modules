output "function_hostname" {
  description = "The default hostname associated with the Function App - such as `mysite.azurewebsites.net`"
  value = azurerm_function_app.core.default_hostname
}
