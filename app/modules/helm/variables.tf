variable "rg_name" {
  description = "The name of the Resource Group in which all resources in this cluster should be created"
}

variable "dns_prefix" {
  description = "The DNS prefix to use for the Kubernetes cluster"
}
