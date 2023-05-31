variable "aks_name" {
  description = "The name of the AKS cluster"
  type        = string
}

variable "location" {
  description = "The Azure location where the resources should be created"
  type        = string
}

variable "rg_name" {
  description = "The name of the resource group where the AKS cluster should be created"
  type        = string
}

variable "node_pool_name" {
  description = "The name of the default node pool in the AKS cluster"
  type        = string
}

variable "node_count" {
  description = "The number of nodes in the default node pool"
  type        = number
}

variable "vm_size" {
  description = "The size of the VMs in the default node pool"
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "The id of the Log Analytics Workspace to which the OMS Agent should send data"
  type        = string
}

variable "rbac_enabled" {
  description = "Indicates if Role Based Access Control is enabled for the AKS cluster"
  type        = bool
}

variable "acr_id" {
  description = "The id of the Azure Container Registry"
  type        = string
}

variable "rg_id" {
  description = "The id of the Resource Group in which the AKS cluster should be created"
  type        = string
}