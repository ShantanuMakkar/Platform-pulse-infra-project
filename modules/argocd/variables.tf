variable "cluster_endpoint" {
  type = string
}

variable "cluster_ca_certificate" {
  description = "Base64-encoded CA data, as returned by modules/eks output cluster_certificate_authority_data."
  type        = string
}

variable "cluster_token" {
  description = "Short-lived auth token from data.aws_eks_cluster_auth."
  type        = string
  sensitive   = true
}

variable "chart_version" {
  description = "argo-cd Helm chart version. Check the real current one before applying: helm repo add argo https://argoproj.github.io/argo-helm && helm repo update && helm search repo argo/argo-cd --versions | head -5"
  type        = string
  default     = "7.7.11"
}