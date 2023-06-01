locals {
  dns_prefix = "mspr-arosaje"
  fqdn       = "${local.dns_prefix}.${local.infra_outputs.location.value}.cloudapp.azure.com"
}

module "helm" {
  source = "./modules/helm"

  rg_name    = local.infra_outputs.resource_group_name.value
  dns_prefix = local.dns_prefix
}

# module "acr_images" {
#   source = "./modules/acr_images"

#   images = [
#     {
#       name = "frontend"
#       path = "https://github.com/MSPR-Dev-Deploiement-IA/frontend.git#main"
#     },
#     {
#       name = "backend"
#       path = "https://github.com/MSPR-Dev-Deploiement-IA/backend.git#main"
#     }
#   ]
#   acr_id              = local.infra_outputs.acr_id.value
#   github_access_token = var.github_access_token
# }


module "kube" {
  source = "./modules/kube"

  fqdn = local.fqdn
}
