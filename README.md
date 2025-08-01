<!-- BEGIN_TF_DOCS -->
[<img src="https://cdn.prod.website-files.com/66b4bc4ca83726f5a87183ab/685136470d15399f106cb13e_adcbd542a834a1942d077cd5c09d3057_GitHub%20cover%20image%201584x396.png">](https://lablabs.io/)

**About us:**</br>
[Labyrinth Labs](https://lablabs.io/) is a one-stop-shop for **DevOps, Cloud & Kubernetes**! We specialize in creating **powerful**, **scalable** and **cloud-native platforms** tailored to elevate your business.

[As a team of experienced DevOps engineers](https://lablabs.io/about/), we know how to help our customers start their journey in the cloud, address the issues they have in their current setups and provide a **strategic solution to transform their infrastructure**.

----
# AWS EKS Prometheus node exporter Terraform module

A terraform module to deploy [Prometheus node exporter](https://prometheus.io/docs/guides/node-exporter/) on Amazon EKS cluster.

[![Terraform validate](https://github.com/lablabs/terraform-aws-eks-prometheus-node-exporter/actions/workflows/validate.yaml/badge.svg)](https://github.com/lablabs/terraform-aws-eks-prometheus-node-exporter/actions/workflows/validate.yaml)
[![pre-commit](https://github.com/lablabs/terraform-aws-eks-prometheus-node-exporter/actions/workflows/pre-commit.yaml/badge.svg)](https://github.com/lablabs/terraform-aws-eks-prometheus-node-exporter/actions/workflows/pre-commit.yaml)

---

## Supported Terraform provider versions

While we are not setting upper bound on the Terraform providers used by the addon we are testing its functionality only against versions specified in the [`.terraform.lock.hcl`](.terraform.lock.hcl) file.

## Deployment methods

### Helm

Deploy Helm chart via Helm resource (default method, set `enabled = true`)

### Argo Kubernetes

Deploy Helm chart as ArgoCD Application via Kubernetes manifest resource (set `enabled = true` and `argo_enabled = true`)

> [!WARNING]
> When deploying with ArgoCD application, Kubernetes terraform provider requires access to Kubernetes cluster API during plan time. This introduces potential issue when you want to deploy the cluster with this addon at the same time, during the same Terraform run.
>
> To overcome this issue, the module deploys the ArgoCD application object using the Helm provider, which does not require API access during plan. If you want to deploy the application using this workaround, you can set the `argo_helm_enabled` variable to `true`.

### Argo Helm

Deploy Helm chart as ArgoCD Application via Helm resource (set `enabled = true`, `argo_enabled = true` and `argo_helm_enabled = true`)

## Examples

See [basic example](examples/basic) for further information.
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.6 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.20 |
| <a name="requirement_utils"></a> [utils](#requirement\_utils) | >= 1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_addon"></a> [addon](#module\_addon) | git::https://github.com/lablabs/terraform-aws-eks-universal-addon.git//modules/addon | v0.0.24 |
## Resources

| Name | Type |
|------|------|
| [utils_deep_merge_yaml.values](https://registry.terraform.io/providers/cloudposse/utils/latest/docs/data-sources/deep_merge_yaml) | data source |
> [!IMPORTANT]
> Variables defined in [variables-addon[-irsa|oidc].tf](variables-addon.tf) defaults to `null` to have them overridable by the addon configuration defined though the [`local.addon[_irsa|oidc].*`](main.tf) local variable with the default values defined in [addon[-irsa|oidc].tf](addon.tf).
## Inputs

| Name | Description | Type |
|------|-------------|------|
| <a name="input_argo_apiversion"></a> [argo\_apiversion](#input\_argo\_apiversion) | ArgoCD Application apiVersion. Defaults to `argoproj.io/v1alpha1`. | `string` |
| <a name="input_argo_destination_server"></a> [argo\_destination\_server](#input\_argo\_destination\_server) | Destination server for ArgoCD Application. Defaults to `https://kubernetes.default.svc`. | `string` |
| <a name="input_argo_enabled"></a> [argo\_enabled](#input\_argo\_enabled) | If set to `true`, the module will be deployed as ArgoCD Application, otherwise it will be deployed as a Helm release. Defaults to `false`. | `bool` |
| <a name="input_argo_helm_enabled"></a> [argo\_helm\_enabled](#input\_argo\_helm\_enabled) | If set to `true`, the ArgoCD Application manifest will be deployed using Kubernetes provider as a Helm release. Otherwise it'll be deployed as a Kubernetes manifest. See README for more info. Defaults to `false`. | `bool` |
| <a name="input_argo_helm_values"></a> [argo\_helm\_values](#input\_argo\_helm\_values) | Value overrides to use when deploying ArgoCD Application object with Helm. Defaults to `""`. | `string` |
| <a name="input_argo_helm_wait_backoff_limit"></a> [argo\_helm\_wait\_backoff\_limit](#input\_argo\_helm\_wait\_backoff\_limit) | Backoff limit for ArgoCD Application Helm release wait job. Defaults to `6`. | `number` |
| <a name="input_argo_helm_wait_kubectl_version"></a> [argo\_helm\_wait\_kubectl\_version](#input\_argo\_helm\_wait\_kubectl\_version) | Version of kubectl to use for ArgoCD Application wait job. Defaults to `1.33.3`. | `string` |
| <a name="input_argo_helm_wait_node_selector"></a> [argo\_helm\_wait\_node\_selector](#input\_argo\_helm\_wait\_node\_selector) | Node selector for ArgoCD Application Helm release wait job. Defaults to `{}`. | `map(string)` |
| <a name="input_argo_helm_wait_timeout"></a> [argo\_helm\_wait\_timeout](#input\_argo\_helm\_wait\_timeout) | Timeout for ArgoCD Application Helm release wait job. Defaults to `10m`. | `string` |
| <a name="input_argo_helm_wait_tolerations"></a> [argo\_helm\_wait\_tolerations](#input\_argo\_helm\_wait\_tolerations) | Tolerations for ArgoCD Application Helm release wait job. Defaults to `[]`. | `list(any)` |
| <a name="input_argo_info"></a> [argo\_info](#input\_argo\_info) | ArgoCD Application manifest info parameter. Defaults to `[{ name = "terraform", value = "true" }]`. | `list(any)` |
| <a name="input_argo_kubernetes_manifest_computed_fields"></a> [argo\_kubernetes\_manifest\_computed\_fields](#input\_argo\_kubernetes\_manifest\_computed\_fields) | List of paths of fields to be handled as `computed`. The user-configured value for the field will be overridden by any different value returned by the API after apply. Defaults to `["metadata.labels", "metadata.annotations", "metadata.finalizers"]`. | `list(string)` |
| <a name="input_argo_kubernetes_manifest_field_manager_force_conflicts"></a> [argo\_kubernetes\_manifest\_field\_manager\_force\_conflicts](#input\_argo\_kubernetes\_manifest\_field\_manager\_force\_conflicts) | Forcibly override any field manager conflicts when applying the kubernetes manifest resource. Defaults to `false`. | `bool` |
| <a name="input_argo_kubernetes_manifest_field_manager_name"></a> [argo\_kubernetes\_manifest\_field\_manager\_name](#input\_argo\_kubernetes\_manifest\_field\_manager\_name) | The name of the field manager to use when applying the Kubernetes manifest resource. Defaults to `Terraform`. | `string` |
| <a name="input_argo_kubernetes_manifest_wait_fields"></a> [argo\_kubernetes\_manifest\_wait\_fields](#input\_argo\_kubernetes\_manifest\_wait\_fields) | A map of fields and a corresponding regular expression with a pattern to wait for. The provider will wait until the field matches the regular expression. Use * for any value. Defaults to `{}`. | `map(string)` |
| <a name="input_argo_metadata"></a> [argo\_metadata](#input\_argo\_metadata) | ArgoCD Application metadata configuration. Override or create additional metadata parameters. Defaults to `{ finalizers = ["resources-finalizer.argocd.argoproj.io"] }`. | `any` |
| <a name="input_argo_name"></a> [argo\_name](#input\_argo\_name) | Name of the ArgoCD Application. Required if `argo_source_type` is set to `kustomize` or `directory`.  If `argo_source_type` is set to `helm`, ArgoCD Application name will equal `helm_release_name`. Defaults to `""`. | `string` |
| <a name="input_argo_namespace"></a> [argo\_namespace](#input\_argo\_namespace) | Namespace to deploy ArgoCD Application to. Defaults to `argo`. | `string` |
| <a name="input_argo_operation"></a> [argo\_operation](#input\_argo\_operation) | ArgoCD Application manifest operation parameter. Defaults to `{}`. | `any` |
| <a name="input_argo_project"></a> [argo\_project](#input\_argo\_project) | ArgoCD Application project. Defaults to `default`. | `string` |
| <a name="input_argo_source_path"></a> [argo\_source\_path](#input\_argo\_source\_path) | ArgoCD Application source path. Required if `argo_source_type` is set to `kustomize` or `directory`. Defaults to `""`. | `string` |
| <a name="input_argo_source_repo_url"></a> [argo\_source\_repo\_url](#input\_argo\_source\_repo\_url) | ArgoCD Application source repo URL. Required if `argo_source_type` is set to `kustomize` or `directory`. Defaults to `""`. | `string` |
| <a name="input_argo_source_target_revision"></a> [argo\_source\_target\_revision](#input\_argo\_source\_target\_revision) | ArgoCD Application source target revision. Required if `argo_source_type` is set to `kustomize` or `directory`. Defaults to `""`. | `string` |
| <a name="input_argo_source_type"></a> [argo\_source\_type](#input\_argo\_source\_type) | Source type for ArgoCD Application. Can be either `helm`, `kustomize`, `directory` or `helm-directory`. Defaults to `helm`. | `string` |
| <a name="input_argo_spec"></a> [argo\_spec](#input\_argo\_spec) | ArgoCD Application spec configuration. Configuration is extended by deep merging with the default spec parameters. Defaults to `{}`. | `any` |
| <a name="input_argo_spec_override"></a> [argo\_spec\_override](#input\_argo\_spec\_override) | ArgoCD Application spec configuration. Configuration is overriden by merging natively with the default spec parameters. Defaults to `{}`. | `any` |
| <a name="input_argo_sync_policy"></a> [argo\_sync\_policy](#input\_argo\_sync\_policy) | ArgoCD Application manifest syncPolicy parameter. Defaults to `{}`. | `any` |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources. | `bool` |
| <a name="input_helm_atomic"></a> [helm\_atomic](#input\_helm\_atomic) | If set, installation process purges chart on fail. The wait flag will be set automatically if atomic is used. Defaults to `false`. | `bool` |
| <a name="input_helm_chart_name"></a> [helm\_chart\_name](#input\_helm\_chart\_name) | Helm chart name to be installed. Required if `argo_source_type` is set to `helm`. Defaults to `""`. | `string` |
| <a name="input_helm_chart_version"></a> [helm\_chart\_version](#input\_helm\_chart\_version) | Version of the Helm chart. Required if `argo_source_type` is set to `helm`. Defaults to `""`. | `string` |
| <a name="input_helm_cleanup_on_fail"></a> [helm\_cleanup\_on\_fail](#input\_helm\_cleanup\_on\_fail) | Allow deletion of new resources created in this Helm upgrade when upgrade fails. Defaults to `false`. | `bool` |
| <a name="input_helm_create_namespace"></a> [helm\_create\_namespace](#input\_helm\_create\_namespace) | Create the Namespace if it does not yet exist. Defaults to `true`. | `bool` |
| <a name="input_helm_dependency_update"></a> [helm\_dependency\_update](#input\_helm\_dependency\_update) | Runs Helm dependency update before installing the chart. Defaults to `false`. | `bool` |
| <a name="input_helm_description"></a> [helm\_description](#input\_helm\_description) | Set Helm release description attribute (visible in the history). Defaults to `""`. | `string` |
| <a name="input_helm_devel"></a> [helm\_devel](#input\_helm\_devel) | Use Helm chart development versions, too. Equivalent to version '>0.0.0-0'. If version is set, this is ignored. Defaults to `false`. | `bool` |
| <a name="input_helm_disable_openapi_validation"></a> [helm\_disable\_openapi\_validation](#input\_helm\_disable\_openapi\_validation) | If set, the installation process will not validate rendered Helm templates against the Kubernetes OpenAPI Schema. Defaults to `false`. | `bool` |
| <a name="input_helm_disable_webhooks"></a> [helm\_disable\_webhooks](#input\_helm\_disable\_webhooks) | Prevent Helm chart hooks from running. Defaults to `false`. | `bool` |
| <a name="input_helm_enabled"></a> [helm\_enabled](#input\_helm\_enabled) | Set to false to prevent installation of the module via Helm release. Defaults to `true`. | `bool` |
| <a name="input_helm_force_update"></a> [helm\_force\_update](#input\_helm\_force\_update) | Force Helm resource update through delete/recreate if needed. Defaults to `false`. | `bool` |
| <a name="input_helm_keyring"></a> [helm\_keyring](#input\_helm\_keyring) | Location of public keys used for verification. Used only if `helm_package_verify` is `true`. Defaults to `~/.gnupg/pubring.gpg`. | `string` |
| <a name="input_helm_lint"></a> [helm\_lint](#input\_helm\_lint) | Run the Helm chart linter during the plan. Defaults to `false`. | `bool` |
| <a name="input_helm_package_verify"></a> [helm\_package\_verify](#input\_helm\_package\_verify) | Verify the package before installing it. Helm uses a provenance file to verify the integrity of the chart; this must be hosted alongside the chart. Defaults to `false`. | `bool` |
| <a name="input_helm_postrender"></a> [helm\_postrender](#input\_helm\_postrender) | Value block with a path to a binary file to run after Helm renders the manifest which can alter the manifest contents. Defaults to `{}`. | `map(any)` |
| <a name="input_helm_recreate_pods"></a> [helm\_recreate\_pods](#input\_helm\_recreate\_pods) | Perform pods restart during Helm upgrade/rollback. Defaults to `false`. | `bool` |
| <a name="input_helm_release_max_history"></a> [helm\_release\_max\_history](#input\_helm\_release\_max\_history) | Maximum number of release versions stored per release. Defaults to `0`. | `number` |
| <a name="input_helm_release_name"></a> [helm\_release\_name](#input\_helm\_release\_name) | Helm release name. Required if `argo_source_type` is set to `helm`. Defaults to `""`. | `string` |
| <a name="input_helm_render_subchart_notes"></a> [helm\_render\_subchart\_notes](#input\_helm\_render\_subchart\_notes) | If set, render Helm subchart notes along with the parent. Defaults to `true`. | `bool` |
| <a name="input_helm_replace"></a> [helm\_replace](#input\_helm\_replace) | Re-use the given name of Helm release, only if that name is a deleted release which remains in the history. This is unsafe in production. Defaults to `false`. | `bool` |
| <a name="input_helm_repo_ca_file"></a> [helm\_repo\_ca\_file](#input\_helm\_repo\_ca\_file) | Helm repositories CA cert file. Defaults to `""`. | `string` |
| <a name="input_helm_repo_cert_file"></a> [helm\_repo\_cert\_file](#input\_helm\_repo\_cert\_file) | Helm repositories cert file. Defaults to `""`. | `string` |
| <a name="input_helm_repo_key_file"></a> [helm\_repo\_key\_file](#input\_helm\_repo\_key\_file) | Helm repositories cert key file. Defaults to `""`. | `string` |
| <a name="input_helm_repo_password"></a> [helm\_repo\_password](#input\_helm\_repo\_password) | Password for HTTP basic authentication against the Helm repository. Defaults to `""`. | `string` |
| <a name="input_helm_repo_url"></a> [helm\_repo\_url](#input\_helm\_repo\_url) | Helm repository. Required if `argo_source_type` is set to `helm`. Defaults to `""`. | `string` |
| <a name="input_helm_repo_username"></a> [helm\_repo\_username](#input\_helm\_repo\_username) | Username for HTTP basic authentication against the Helm repository. Defaults to `""`. | `string` |
| <a name="input_helm_reset_values"></a> [helm\_reset\_values](#input\_helm\_reset\_values) | When upgrading, reset the values to the ones built into the Helm chart. Defaults to `false`. | `bool` |
| <a name="input_helm_reuse_values"></a> [helm\_reuse\_values](#input\_helm\_reuse\_values) | When upgrading, reuse the last Helm release's values and merge in any overrides. If `helm_reset_values` is specified, this is ignored. Defaults to `false`. | `bool` |
| <a name="input_helm_set_sensitive"></a> [helm\_set\_sensitive](#input\_helm\_set\_sensitive) | Value block with custom sensitive values to be merged with the values yaml that won't be exposed in the plan's diff. Defaults to `{}`. | `map(any)` |
| <a name="input_helm_skip_crds"></a> [helm\_skip\_crds](#input\_helm\_skip\_crds) | If set, no CRDs will be installed before Helm release. Defaults to `false`. | `bool` |
| <a name="input_helm_timeout"></a> [helm\_timeout](#input\_helm\_timeout) | Time in seconds to wait for any individual Kubernetes operation (like Jobs for hooks). Defaults to `300`. | `number` |
| <a name="input_helm_wait"></a> [helm\_wait](#input\_helm\_wait) | Will wait until all Helm release resources are in a ready state before marking the release as successful. It will wait for as long as timeout. Defaults to `false`. | `bool` |
| <a name="input_helm_wait_for_jobs"></a> [helm\_wait\_for\_jobs](#input\_helm\_wait\_for\_jobs) | If wait is enabled, will wait until all Helm Jobs have been completed before marking the release as successful. It will wait for as long as timeout. Defaults to `false`. | `bool` |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | The Kubernetes Namespace in which the Helm chart will be installed (required). | `string` |
| <a name="input_settings"></a> [settings](#input\_settings) | Additional Helm sets which will be passed to the Helm chart values or Kustomize or directory configuration which will be passed to ArgoCD Application source. Defaults to `{}`. | `map(any)` |
| <a name="input_values"></a> [values](#input\_values) | Additional YAML encoded values which will be passed to the Helm chart. Defaults to `""`. | `string` |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_addon"></a> [addon](#output\_addon) | The addon module outputs |
## Contributing and reporting issues

Feel free to create an issue in this repository if you have questions, suggestions or feature requests.

### Validation, linters and pull-requests

We want to provide high quality code and modules. For this reason we are using
several [pre-commit hooks](.pre-commit-config.yaml) and
[GitHub Actions workflows](.github/workflows/). A pull-request to the
main branch will trigger these validations and lints automatically. Please
check your code before you will create pull-requests. See
[pre-commit documentation](https://pre-commit.com/) and
[GitHub Actions documentation](https://docs.github.com/en/actions) for further
details.

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

```plan
Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

  <https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.
```
<!-- END_TF_DOCS -->
