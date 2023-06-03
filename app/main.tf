locals {
  dns_prefix = "mspr-arosaje"
  fqdn       = "${local.dns_prefix}.${local.infra_outputs.location.value}.cloudapp.azure.com"
}

module "helm" {
  source = "./modules/helm"

  rg_name    = local.infra_outputs.resource_group_name.value
  dns_prefix = local.dns_prefix
}

module "kube" {
  source = "./modules/kube"

  fqdn = local.fqdn
}
