variable "acr_name" {
  description = "The name of the Azure Container Registry"
}
variable "rg_name" {
  description = "The name of the Azure Resource Group"
}
variable "location" {
  description = "The Azure Region where the Azure Container Registry will be created"
}
variable "acr_sku" {
  description = "The SKU of the Azure Container Registry"
  default     = "Basic"
}

variable "images" {
  description = "The list of images to be deployed to the AKS cluster"
  type = list(object({
    name = string
    path = string
  }))
}

variable "github_access_token" {
  description = "The access token for the Azure Container Registry"
  type        = string
  sensitive   = true
}
