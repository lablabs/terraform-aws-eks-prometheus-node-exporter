resource "helm_release" "prometheus_node_exporter" {
  count            = var.enabled && !var.argo_application_enabled ? 1 : 0
  chart            = var.helm_chart_name
  create_namespace = var.helm_create_namespace
  namespace        = var.k8s_namespace
  name             = var.helm_release_name
  version          = var.helm_chart_version
  repository       = var.helm_repo_url

  values = [
    var.values
  ]

  dynamic "set" {
    for_each = var.settings
    content {
      name  = set.key
      value = set.value
    }
  }
}
