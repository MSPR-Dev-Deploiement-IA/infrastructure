terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.59.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.20.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.9.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.5.1"
    }
  }

  backend "azurerm" {
    resource_group_name  = "terraform-backends"
    storage_account_name = "mspr"
    container_name       = "tfstate"
    key                  = "app.terraform.tfstate"
  }
}

provider "random" {
  # Configuration options
}

provider "azurerm" {
  # Configuration options$
  features {

  }

  # client_id       = "90e09199-b541-45d0-a415-a772edf9a745"
  # tenant_id       = "5369cc18-884b-45b0-80a5-7b66171f60cf"
  # subscription_id = var.subscription_id
  # client_secret   = var.client_secret
}

provider "kubernetes" {
  host                   = local.infra_outputs.host.value
  username               = local.infra_outputs.username.value
  password               = local.infra_outputs.password.value
  client_certificate     = base64decode(local.infra_outputs.client_certificate.value)
  client_key             = base64decode(local.infra_outputs.client_key.value)
  cluster_ca_certificate = base64decode(local.infra_outputs.cluster_ca_certificate.value)
}


provider "helm" {
  kubernetes {
    host                   = local.infra_outputs.host.value
    username               = local.infra_outputs.username.value
    password               = local.infra_outputs.password.value
    client_certificate     = base64decode(local.infra_outputs.client_certificate.value)
    client_key             = base64decode(local.infra_outputs.client_key.value)
    cluster_ca_certificate = base64decode(local.infra_outputs.cluster_ca_certificate.value)
  }
}
