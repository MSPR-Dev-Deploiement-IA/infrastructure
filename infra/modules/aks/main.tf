resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.aks_name
  location            = var.location
  resource_group_name = var.rg_name
  dns_prefix          = var.aks_name

  http_application_routing_enabled = true

  default_node_pool {
    name       = var.node_pool_name
    node_count = var.node_count
    vm_size    = var.vm_size
  }

  oms_agent {
    log_analytics_workspace_id = var.log_analytics_workspace_id
  }

  identity {
    type = "SystemAssigned"
  }

  role_based_access_control_enabled = var.rbac_enabled
}

resource "azurerm_role_assignment" "acr_pull" {
  principal_id                     = azurerm_kubernetes_cluster.aks_cluster.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = var.acr_id
  skip_service_principal_aad_check = true
}

data "azurerm_subscription" "primary_subscription" {}

resource "azurerm_role_definition" "custom_network_role" {
  name  = "customNetworkRole"
  scope = var.rg_id

  permissions {
    actions = [
      "Microsoft.Network/publicIPAddresses/read",
      "Microsoft.Network/publicIPAddresses/write",
      "Microsoft.Network/publicIPAddresses/delete",
      "Microsoft.Network/publicIPAddresses/join/action",
    ]
    not_actions = []
  }

  assignable_scopes = [
    var.rg_id,
  ]
}

resource "azurerm_role_assignment" "network_role_assignment" {
  principal_id                     = azurerm_kubernetes_cluster.aks_cluster.identity[0].principal_id
  role_definition_name             = azurerm_role_definition.custom_network_role.name
  scope                            = var.rg_id
  skip_service_principal_aad_check = true
}