locals {
  infra_outputs = jsondecode(file("config.json"))
  dns_prefix    = local.infra_outputs.aks_name.value
  fqdn          = "${local.dns_prefix}.${local.infra_outputs.location.value}.cloudapp.azure.com"
}
