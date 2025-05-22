/**
 * # AWS EKS Prometheus node exporter Terraform module
 *
 * A terraform module to deploy [Prometheus node exporter](https://prometheus.io/docs/guides/node-exporter/) on Amazon EKS cluster.
 *
 * ![Terraform validation](https://github.com/lablabs/terraform-aws-eks-prometheus-node-exporter/workflows/Terraform%20validation/badge.svg?branch=master)
 * [![pre-commit](https://img.shields.io/badge/pre--commit-enabled-success?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
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
