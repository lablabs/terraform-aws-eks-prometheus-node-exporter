data "helm_repository" "default" {
  depends_on = [var.mod_dependency]
  name       = var.helm_repo_name
  url        = var.helm_repo_url
}

data "aws_region" "current" {}

resource "helm_release" "helm" {
  depends_on = [var.mod_dependency]
  count      = var.enabled ? 1 : 0
  name       = var.helm_release_name
  repository = data.helm_repository.default.metadata[0].name
  chart      = var.helm_chart_name
  namespace  = var.k8s_namespace
  version    = var.helm_chart_version
}
