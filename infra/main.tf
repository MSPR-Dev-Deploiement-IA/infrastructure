resource "azurerm_resource_group" "rg" {
  name     = "mspr"
  location = var.location
}

module "acr" {
  source = "./modules/acr"

  acr_name = "msprarosajeacr"
  rg_name  = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  acr_sku  = "Standard"

  github_access_token = var.github_access_token
}

module "logs" {
  source = "./modules/logs"

  log_workspace_name = "msprarosajelog"
  location           = azurerm_resource_group.rg.location
  rg_name            = azurerm_resource_group.rg.name
}

module "aks" {
  source = "./modules/aks"

  aks_name                   = "arosaje"
  location                   = azurerm_resource_group.rg.location
  rg_name                    = azurerm_resource_group.rg.name
  node_pool_name             = "default"
  node_count                 = 1
  vm_size                    = "Standard_A4_v2"
  log_analytics_workspace_id = module.logs.log_workspace_id
  rbac_enabled               = true
  acr_id                     = module.acr.acr_id
  rg_id                      = azurerm_resource_group.rg.id
}
