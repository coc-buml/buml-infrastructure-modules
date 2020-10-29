output "log_analytic_primary_key" {
  description = "The Primary shared key for the Log Analytics Workspace."
  value = azurerm_log_analytics_workspace.core.primary_shared_key
}

output "log_analytic_workspace_id" {
  description = "The Workspace (or Customer) ID for the Log Analytics Workspace."
  value = azurerm_log_analytics_workspace.core.workspace_id
}
