variable "github_access_token" {
  sensitive = true
}

variable "images" {
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
