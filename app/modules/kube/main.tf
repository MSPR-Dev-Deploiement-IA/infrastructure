# CERTS
resource "kubernetes_manifest" "cert_ressource" {
  manifest = yamldecode(templatefile("./modules/kube/manifests/cert/ressource.yml", { fqdn = var.fqdn }))
}

resource "kubernetes_manifest" "cert_letsencrypt" {
  manifest = yamldecode(templatefile("./modules/kube/manifests/cert/letsencrypt_prod.yml", { email = "germain.leignel@gmail.com" }))
}

# POSTGRES
resource "kubernetes_manifest" "postgres_persistent_volume_claim" {
  manifest = yamldecode(file("./modules/kube/manifests/database/persistant_volume_claim.yml"))
}

resource "kubernetes_manifest" "postgres_deployment" {
  manifest = yamldecode(file("./modules/kube/manifests/database/deployment.yml"))
}

resource "kubernetes_manifest" "postgres_service" {
  manifest = yamldecode(file("./modules/kube/manifests/database/service.yml"))
}


# BACKEND
resource "kubernetes_manifest" "backend_deployment" {
  manifest = yamldecode(file("./modules/kube/manifests/backend/deployment.yml"))
}

resource "kubernetes_manifest" "backend_service" {
  manifest = yamldecode(file("./modules/kube/manifests/backend/service.yml"))
}

resource "kubernetes_manifest" "backend_volume" {
  manifest = yamldecode(file("./modules/kube/manifests/backend/volume.yml"))
}

resource "kubernetes_manifest" "backend_ingress" {
  manifest = yamldecode(templatefile("./modules/kube/manifests/backend/ingress.yml", { ingress_host = var.fqdn }))
}


# FRONTEND
# resource "kubernetes_manifest" "frontend_deployment" {
#   manifest = yamldecode(templatefile("./modules/kube/manifests/frontend/deployment.yml", { backend_url = "${var.fqdn}/backend" }))
# }

resource "kubernetes_manifest" "frontend_deployment" {
  manifest = yamldecode(file("./modules/kube/manifests/frontend/deployment.yml"))
}

resource "kubernetes_manifest" "frontend_service" {
  manifest = yamldecode(file("./modules/kube/manifests/frontend/service.yml"))
}

resource "kubernetes_manifest" "frontend_ingress" {
  manifest = yamldecode(templatefile("./modules/kube/manifests/frontend/ingress.yml", { ingress_host = var.fqdn }))
}

