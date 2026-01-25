# Adopted Device Statistics Terraform Module

This module return device statistics for an adopted device linked to a sites managed by your Unifi Network application.

## Examples

- [Get Adopted Device Statistics](../../examples/get_adopted_device_statistics)

## Limitations

N/A

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.14 |
| <a name="requirement_restful"></a> [restful](#requirement\_restful) | ~> 0.25 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_restful"></a> [restful](#provider\_restful) | ~> 0.25 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [restful_resource.adopted_device_statistics](https://registry.terraform.io/providers/magodo/restful/latest/docs/data-sources/resource) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_device_id"></a> [device\_id](#input\_device\_id) | ## Description<br/><br/>  Device Id.<br/><br/>  ## Example<br/><br/>  `c94dadd5-4368-3273-bf77-d45d2e9e0cc1`<br/><br/>  ## How to get the device Id<br/><br/>  You can use the `adopted_devices` sub-module to get the device id. | `string` | n/a | yes |
| <a name="input_site_id"></a> [site\_id](#input\_site\_id) | ## Description<br/><br/>  Unifi site Id.<br/><br/>  ## Example<br/><br/>  `4c2d331d-6cdc-39d5-ae48-7457ff007b02`<br/><br/>  ## How to get the site Id<br/><br/>  You can use the `sites` sub-module to get the site id. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_adopted_device_statistics"></a> [adopted\_device\_statistics](#output\_adopted\_device\_statistics) | ## Description<br/><br/>  Statistics of an adopted device.<br/><br/>  ## Learn more<br/><br/>  https://developer.ui.com/network/v10.1.68/getadopteddevicelateststatistics<br/><br/>  ## Example<pre>hcl<br/>  {<br/>    "uptimeSec"             = 5704058<br/>    "lastHeartbeatAt"       = "2026-01-24T23:04:12Z"<br/>    "nextHeartbeatAt"       = "2026-01-24T23:04:27Z"<br/>    "cpuUtilizationPct"     = 5.8<br/>    "memoryUtilizationPct"  = 77.2<br/>    "uplink"                = {<br/>      "txRateBps" = 0<br/>      "rxRateBps" = 0<br/>    }<br/>    "interfaces"            = {}<br/>  }</pre> |
<!-- END_TF_DOCS -->
