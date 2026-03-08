# Wifi Broadcasts Terraform Module

This module list Wifi Broadcasts managed by your Unifi Network application.

## Examples

- [List Wifi Broadcasts](../../examples/list_wifi_broadcasts)

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
| [restful_resource.wifi_broadcasts](https://registry.terraform.io/providers/magodo/restful/latest/docs/data-sources/resource) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_query_parameters"></a> [query\_parameters](#input\_query\_parameters) | ## Description<br/><br/>  Query parameters to be sent with the API request.<br/><br/>  ## Example<pre>hcl<br/>  {<br/>    offset = 10<br/>    limit  = 20<br/>    filter = "metadata.origin.eq('USER_DEFINED')"<br/>  }</pre> | <pre>object({<br/>    offset = optional(number)<br/>    limit  = optional(number)<br/>    filter = optional(string)<br/>  })</pre> | `{}` | no |
| <a name="input_site_id"></a> [site\_id](#input\_site\_id) | ## Description<br/><br/>  Unifi site Id.<br/><br/>  ## Example<br/><br/>  `4c2d331d-6cdc-39d5-ae48-7457ff007b02`<br/><br/>  ## How to get the site Id<br/><br/>  You can use the `sites` sub-module to get the site id. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_wifi_broadcasts"></a> [wifi\_broadcasts](#output\_wifi\_broadcasts) | ## Description<br/><br/>  List of wifi broadcasts managed by the Unifi Network Application.<br/><br/>  ## Learn more<br/><br/>  https://developer.ui.com/network/v10.1.84/getwifibroadcastpage<br/><br/>  ## Example<pre>hcl<br/>  {<br/>    count      = 2<br/>    data       = [<br/>      {<br/>        broadcastingFrequenciesGHz = [<br/>          2.4,<br/>          5,<br/>          6,<br/>        ]<br/>        enabled                    = true<br/>        hotspotConfiguration       = {}<br/>        id                         = "2ef18ba7-616d-45fd-85e0-f5ce03e7f3e6"<br/>        metadata                   = {<br/>          origin = "USER_DEFINED"<br/>        }<br/>        name                       = "Orion"<br/>        network                    = {<br/>          networkId = "5810976b-0718-42b9-95da-85261e7eefd2"<br/>          type      = "SPECIFIC"<br/>        }<br/>        securityConfiguration      = {<br/>          type = "WPA3_ENTERPRISE"<br/>        }<br/>        type                       = "STANDARD"<br/>      },<br/>      {<br/>        broadcastingFrequenciesGHz = [<br/>          2.4,<br/>          5,<br/>          6,<br/>        ]<br/>        enabled                    = true<br/>        id                         = "fd3c4c5c-b7c5-4cdc-ad10-767ed6c6f12e"<br/>        metadata                   = {<br/>          origin = "USER_DEFINED"<br/>        }<br/>        name                       = "Identity"<br/>        network                    = {<br/>          type = "NATIVE"<br/>        }<br/>        securityConfiguration      = {<br/>          type = "WPA3_ENTERPRISE"<br/>        }<br/>        type                       = "STANDARD"<br/>      },<br/>    ]<br/>    limit      = 10<br/>    offset     = 0<br/>    totalCount = 2<br/>  }</pre> |
<!-- END_TF_DOCS -->
