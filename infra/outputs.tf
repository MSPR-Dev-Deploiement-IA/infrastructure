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
