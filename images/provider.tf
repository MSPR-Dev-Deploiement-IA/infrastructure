terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.59.0"
    }
  }

  # backend "azurerm" {
  #   resource_group_name  = "terraform_backends"
  #   storage_account_name = "gmnbackends"
  #   container_name       = "mspr"
  #   key                  = "infra.terraform.tfstate"
  # }
}

locals {
  infra_outputs = jsondecode(file("config.json"))
}

provider "azurerm" {
  # Configuration options$
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }

  # client_id       = "90e09199-b541-45d0-a415-a772edf9a745"
  # tenant_id       = "5369cc18-884b-45b0-80a5-7b66171f60cf"
  # subscription_id = var.subscription_id
  # client_secret   = var.client_secret
}
