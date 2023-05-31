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
resource "kubernetes_manifest" "backend_deplyment" {
  manifest = yamldecode(file("./modules/kube/manifests/backend/deployment.yml"))
}

resource "kubernetes_manifest" "backend_service" {
  manifest = yamldecode(file("./modules/kube/manifests/backend/service.yml"))
}

resource "kubernetes_manifest" "backend_ingress" {
  manifest = yamldecode(templatefile("./modules/kube/manifests/backend/ingress.yml", { ingress_host = var.fqdn }))
}
