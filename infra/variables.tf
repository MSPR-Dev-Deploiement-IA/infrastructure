variable "subscription_id" {
  sensitive = true
}
variable "client_secret" {
  sensitive = true
}

variable "location" {
  default = "westeurope"
}