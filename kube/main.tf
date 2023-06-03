locals {
  dns_prefix = "mspr-arosaje"
  fqdn       = "${local.dns_prefix}.${local.infra_outputs.location.value}.cloudapp.azure.com"
}

module "kube" {
  source = "./modules/kube"

  fqdn = local.fqdn
}
