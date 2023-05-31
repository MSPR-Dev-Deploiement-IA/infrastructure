output "acr_login_server" {
  description = "The URL of the Docker registry."
  value       = azurerm_container_registry.example.login_server
}

output "acr_id" {
  description = "The Azure Resource Manager ID of the Container Registry."
  value       = azurerm_container_registry.example.id
}
