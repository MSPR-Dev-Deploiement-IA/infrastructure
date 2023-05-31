resource "azurerm_log_analytics_workspace" "aks_log_workspace" {
  name                = var.log_workspace_name
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_log_analytics_solution" "container_insights_solution" {
  solution_name         = "ContainerInsights"
  location              = var.location
  resource_group_name   = var.rg_name
  workspace_resource_id = azurerm_log_analytics_workspace.aks_log_workspace.id
  workspace_name        = azurerm_log_analytics_workspace.aks_log_workspace.name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}