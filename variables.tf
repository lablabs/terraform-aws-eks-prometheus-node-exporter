# Required module inputs

variable "cluster_name" {}
variable "cluster_identity_oidc_issuer" {}
variable "cluster_identity_oidc_issuer_arn" {}

# terraform-aws-eks-prometheus-node-exporter

variable "enabled" {
  type = bool
}

# Helm

variable "helm_chart_name" {
  default = "prometheus-node-exporter"
}

variable "helm_chart_version" {
  default = "1.11.0"
}

variable "helm_release_name" {
  default = "prometheus-node-exporter"
}

variable "helm_repo_url" {
  default = "https://kubernetes-charts.storage.googleapis.com"
}

# K8S

variable "k8s_namespace" {
  default = "kube-system"
}

variable "mod_dependency" {
  default = null
}
