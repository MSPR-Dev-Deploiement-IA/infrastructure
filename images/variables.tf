variable "location" {
  default = "francecentral"
}

variable "github_access_token" {
  description = "The access token for the GitHub repository"
  type        = string
  sensitive   = true
}

variable "images" {
  description = "The list of images to build"
  type = list(object({
    name = string
    path = string
  }))
  default = [
    {
      name = "frontend"
      path = "https://github.com/MSPR-Dev-Deploiement-IA/frontend.git#main"
    },
    {
      name = "backend"
      path = "https://github.com/MSPR-Dev-Deploiement-IA/backend.git#main"
    }
  ]
}
