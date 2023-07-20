variable "location" {
  default = "francecentral"
}

variable "github_access_token" {
  description = "The access token for the GitHub repository"
  type        = string
  sensitive   = true
}

variable "email" {
  description = "The email address for the acme account"
  type        = string
  sensitive   = true
}