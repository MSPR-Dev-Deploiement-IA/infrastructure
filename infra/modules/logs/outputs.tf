output "log_workspace_id" {
  description = "The ID of the created log analytics workspace"
  value       = azurerm_log_analytics_workspace.aks_log_workspace.id
}

output "log_workspace_name" {
  description = "The name of the created log analytics workspace"
  value       = azurerm_log_analytics_workspace.aks_log_workspace.name
}
