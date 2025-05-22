/**
 * # AWS EKS node problem detector Terraform module
 *
 * A Terraform module to deploy a [node problem detector](https://github.com/kubernetes/node-problem-detector) on Amazon EKS cluster.
 *
 * [![Terraform validate](https://github.com/lablabs/terraform-aws-eks-node-problem-detector/actions/workflows/validate.yaml/badge.svg)](https://github.com/lablabs/terraform-aws-eks-node-problem-detector/actions/workflows/validate.yaml)
 * [![pre-commit](https://github.com/lablabs/terraform-aws-eks-node-problem-detector/workflows/pre-commit.yml/badge.svg)](https://github.com/lablabs/terraform-aws-eks-node-problem-detector/actions/workflows/pre-commit.yml)
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
