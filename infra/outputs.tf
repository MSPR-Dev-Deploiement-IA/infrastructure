output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "location" {
  value = azurerm_resource_group.rg.location
}

output "host" {
  value     = module.aks.host
  sensitive = true
}

output "username" {
  value     = module.aks.username
  sensitive = true
}

output "password" {
  value     = module.aks.password
  sensitive = true
}

output "client_certificate" {
  value     = module.aks.client_certificate
  sensitive = true
}

output "client_key" {
  value     = module.aks.client_key
  sensitive = true
}

output "cluster_ca_certificate" {
  value     = module.aks.cluster_ca_certificate
  sensitive = true
}

output "acr_id" {
  value     = module.acr.acr_id
  sensitive = true
}

output "acr_login_server" {
  value     = module.acr.acr_login_server
  sensitive = true
}

output "acr_admin_username" {
  value     = module.acr.acr_admin_username
  sensitive = true
}

output "acr_admin_password" {
  value     = module.acr.acr_admin_password
  sensitive = true
}

output "aks_name" {
  value     = module.aks.aks_name
  sensitive = true
}
