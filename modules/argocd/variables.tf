variable "chart_version" {
  description = "argo-cd Helm chart version. Check the real current one before applying: helm repo add argo https://argoproj.github.io/argo-helm && helm repo update && helm search repo argo/argo-cd --versions | head -5"
  type        = string
  default     = "7.7.11"
}