output "acr_login_server" {
  description = "The URL of the Docker registry."
  value       = azurerm_container_registry.example.login_server
}

output "acr_id" {
  description = "The Azure Resource Manager ID of the Container Registry."
  value       = azurerm_container_registry.example.id
}

output "acr_admin_username" {
  description = "The username to log into the Container Registry."
  value       = azurerm_container_registry.example.admin_username
  sensitive = true
}

output "acr_admin_password" {
  description = "The password to log into the Container Registry."
  value       = azurerm_container_registry.example.admin_password
  sensitive = true
}