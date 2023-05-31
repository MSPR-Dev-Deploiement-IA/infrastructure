resource "azurerm_resource_group" "rg" {
  name     = "msprarosaje-rg"
  location = var.location
}

module "acr" {
  source = "./modules/acr"

  acr_name = "msprarosajeacr"
  rg_name  = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  acr_sku  = "Standard"
}

module "logs" {
  source = "./modules/logs"

  log_workspace_name = "msprarosajelogs"
  location           = azurerm_resource_group.rg.location
  rg_name            = azurerm_resource_group.rg.name
}

module "aks" {
  source = "./modules/aks"

  aks_name                   = "msprarosajeaks"
  location                   = azurerm_resource_group.rg.location
  rg_name                    = azurerm_resource_group.rg.name
  node_pool_name             = "default"
  node_count                 = 1
  vm_size                    = "Standard_B2s"
  log_analytics_workspace_id = module.logs.log_workspace_id
  rbac_enabled               = true
  acr_id                     = module.acr.acr_id
}
