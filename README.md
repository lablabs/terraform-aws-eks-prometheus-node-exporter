# AWS EKS Prometheus node exporter Terraform module

[![Labyrinth Labs logo](ll-logo.png)](https://www.lablabs.io)

We help companies build, run, deploy and scale software and infrastructure by embracing the right technologies and principles. Check out our website at https://lablabs.io/

---

![Terraform validation](https://github.com/lablabs/terraform-aws-eks-prometheus-node-exporter/workflows/Terraform%20validation/badge.svg?branch=master)

## Description

A terraform module to deploy Prometheus node exporter on Amazon EKS cluster.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 0.12.0 |
| aws | ~> 2.0 |
| helm | ~> 1.2 |
| local | ~> 1.2 |
| null | ~> 2.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cluster\_identity\_oidc\_issuer | n/a | `any` | n/a | yes |
| cluster\_identity\_oidc\_issuer\_arn | n/a | `any` | n/a | yes |
| cluster\_name | n/a | `any` | n/a | yes |
| enabled | n/a | `bool` | n/a | yes |
| helm\_chart\_name | n/a | `string` | `"prometheus-node-exporter"` | no |
| helm\_chart\_version | n/a | `string` | `"1.11.0"` | no |
| helm\_release\_name | n/a | `string` | `"prometheus-node-exporter"` | no |
| helm\_repo\_url | n/a | `string` | `"https://kubernetes-charts.storage.googleapis.com"` | no |
| k8s\_namespace | n/a | `string` | `"kube-system"` | no |
| mod\_dependency | n/a | `any` | `null` | no |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Contributing and reporting issues

Feel free to create an issue in this repository if you have questions, suggestions or feature requests.

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.
