# POSTGRES
resource "kubernetes_manifest" "postgres_persistent_volume_claim" {
  manifest = yamldecode(file("./manifests/database/persistant_volume_claim.yml"))
}

resource "kubernetes_manifest" "postgres_deployment" {
  manifest = yamldecode(file("./manifests/database/deployment.yml"))
}

resource "kubernetes_manifest" "postgres_service" {
  manifest = yamldecode(file("./manifests/database/service.yml"))
}


# BACKEND
resource "kubernetes_manifest" "backend_deployment" {
  manifest = yamldecode(templatefile("./manifests/backend/deployment.yml", { ingress_host = local.fqdn }))
}

resource "kubernetes_manifest" "backend_service" {
  manifest = yamldecode(file("./manifests/backend/service.yml"))
}

resource "kubernetes_manifest" "backend_volume" {
  manifest = yamldecode(file("./manifests/backend/volume.yml"))
}

resource "kubernetes_manifest" "backend_ingress" {
  manifest = yamldecode(templatefile("./manifests/backend/ingress.yml", { ingress_host = local.fqdn }))
}

resource "kubernetes_manifest" "backend_certificate" {
  manifest = yamldecode(templatefile("./manifests/backend/certificate.yml", { ingress_host = local.fqdn }))
}

resource "kubernetes_manifest" "backend_issuer" {
  manifest = yamldecode(templatefile("./manifests/backend/issuer.yml", { ingress_host = local.fqdn, email = var.email }))
}


# FRONTEND
resource "kubernetes_manifest" "frontend_deployment" {
  manifest = yamldecode(templatefile("./manifests/frontend/deployment.yml", { ingress_host = local.fqdn }))
}

resource "kubernetes_manifest" "frontend_service" {
  manifest = yamldecode(file("./manifests/frontend/service.yml"))
}

resource "kubernetes_manifest" "frontend_ingress" {
  manifest = yamldecode(templatefile("./manifests/frontend/ingress.yml", { ingress_host = local.fqdn }))
}


# PGADMIN
resource "kubernetes_manifest" "pgadmin_deployment" {
  manifest = yamldecode(templatefile("./manifests/pgadmin/deployment.yml", { ingress_host = local.fqdn }))
}

resource "kubernetes_manifest" "pgadmin_service" {
  manifest = yamldecode(file("./manifests/pgadmin/service.yml"))
}

resource "kubernetes_manifest" "pgadmin_ingress" {
  manifest = yamldecode(templatefile("./manifests/pgadmin/ingress.yml", { ingress_host = local.fqdn }))
}
