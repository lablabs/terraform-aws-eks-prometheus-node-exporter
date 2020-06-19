# terraform-aws-eks-prometheus-node-exporter
## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 0.12.0 |
| aws | ~> 2.0 |
| helm | ~> 1.0 |
| local | ~> 1.2 |
| null | ~> 2.0 |

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.0 |
| helm | ~> 1.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cluster\_identity\_oidc\_issuer | n/a | `any` | n/a | yes |
| cluster\_identity\_oidc\_issuer\_arn | n/a | `any` | n/a | yes |
| cluster\_name | Required module inputs | `any` | n/a | yes |
| enabled | terraform-aws-eks-prometheus-node-exporter | `bool` | n/a | yes |
| helm\_chart\_name | Helm | `string` | `"prometheus-node-exporter"` | no |
| helm\_chart\_version | n/a | `string` | `"1.11.0"` | no |
| helm\_release\_name | n/a | `string` | `"prometheus-node-exporter"` | no |
| helm\_repo\_name | n/a | `string` | `"stable"` | no |
| helm\_repo\_url | n/a | `string` | `"https://kubernetes-charts.storage.googleapis.com"` | no |
| k8s\_namespace | K8S | `string` | `"kube-system"` | no |
| mod\_dependency | n/a | `any` | `null` | no |

## Outputs

No output.