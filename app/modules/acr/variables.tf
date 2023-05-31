variable "images" {
  description = "The list of images to be deployed to the AKS cluster"
  type = list(object({
    name = string
    path = string
  }))
}

variable "acr_id" {
  description = "The id of the Azure Container Registry"
  type        = string
}

variable "github_access_token" {
  description = "The access token for the Azure Container Registry"
  type        = string
  sensitive   = true
}
