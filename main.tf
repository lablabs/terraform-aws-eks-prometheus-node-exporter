/**
 * # AWS EKS Prometheus node exporter Terraform module
 *
 * A terraform module to deploy [Prometheus node exporter](https://prometheus.io/docs/guides/node-exporter/) on Amazon EKS cluster.
 *
 * [![Terraform validate](https://github.com/lablabs/terraform-aws-eks-prometheus-node-exporter/actions/workflows/validate.yaml/badge.svg)](https://github.com/lablabs/terraform-aws-eks-prometheus-node-exporter/actions/workflows/validate.yaml)
 * [![pre-commit](https://github.com/lablabs/terraform-aws-eks-prometheus-node-exporter/actions/workflows/pre-commit.yaml/badge.svg)](https://github.com/lablabs/terraform-aws-eks-prometheus-node-exporter/actions/workflows/pre-commit.yaml)
 */
locals {
  addon = {
    name      = "prometheus-node-exporter"
    namespace = "kube-system"

    helm_chart_version = "4.43.1"
    helm_repo_url      = "https://prometheus-community.github.io/helm-charts"
  }

  addon_values = yamlencode({})

  addon_depends_on = []
}
