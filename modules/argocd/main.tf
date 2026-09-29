provider "helm" {
  kubernetes {
    host                   = var.cluster_endpoint
    cluster_ca_certificate = base64decode(var.cluster_ca_certificate)
    token                  = var.cluster_token
  }
}

resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  version          = var.chart_version
  namespace        = "argocd"
  create_namespace = true

  # ClusterIP, not a LoadBalancer — an ALB/NLB here would add hourly cost
  # for a POC. Access is via kubectl port-forward (see README).
  values = [yamlencode({
    server = {
      service = {
        type = "ClusterIP"
      }
    }
  })]
}