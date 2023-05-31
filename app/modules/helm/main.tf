resource "helm_release" "nginx_ingress" {
  name       = "nginx-ingress"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = "4.6.1"
  namespace  = "default"

  values = [
    file("./modules/helm/values/ingress.yml")
  ]

  set {
    name  = "controller.ingressClass"
    value = "nginx"
  }

  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/azure-load-balancer-resource-group"
    value = var.rg_name
  }

  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/azure-load-balancer-pip-name"
    value = var.dns_prefix
  }

  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/azure-dns-label-name"
    value = var.dns_prefix
  }
}

resource "helm_release" "kube-dashboard" {
  name       = "kube-dashboard"
  repository = "https://kubernetes.github.io/dashboard/"
  chart      = "kubernetes-dashboard"
  version    = "6.0.7"

  values = [
    file("./modules/helm/values/kube_dashboard.yml")
  ]
}
