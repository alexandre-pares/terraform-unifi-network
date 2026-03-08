# Connected Clients Terraform Module

This module list connected clients to a Unifi Network application.

## Examples

- [List Connected Clients](../../examples/list_connected_clients)

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
| [restful_resource.clients](https://registry.terraform.io/providers/magodo/restful/latest/docs/data-sources/resource) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_query_parameters"></a> [query\_parameters](#input\_query\_parameters) | ## Description<br/><br/>  Query parameters to be sent with the API request.<br/><br/>  ## Example<pre>hcl<br/>  {<br/>    offset = 10<br/>    limit  = 20<br/>    filter = "type.eq('WIRELESS')"<br/>  }</pre> | <pre>object({<br/>    offset = optional(number)<br/>    limit  = optional(number)<br/>    filter = optional(string)<br/>  })</pre> | `{}` | no |
| <a name="input_site_id"></a> [site\_id](#input\_site\_id) | ## Description<br/><br/>  Unifi site Id.<br/><br/>  ## Example<br/><br/>  `4c2d331d-6cdc-39d5-ae48-7457ff007b02`<br/><br/>  ## How to get the site Id<br/><br/>  You can use the `sites` sub-module to get the site id. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_clients"></a> [clients](#output\_clients) | ## Description<br/><br/>  List of connected clients managed by the Unifi Network Application.<br/><br/>  ## Learn more<br/><br/>  https://developer.ui.com/network/v10.1.84/getconnectedclientoverviewpage<br/><br/>  ## Example<pre>hcl<br/>  {<br/>    count      = 5<br/>    data       = [<br/>      {<br/>        access         = {<br/>          type = "DEFAULT"<br/>        }<br/>        connectedAt    = "2026-02-10T18:46:25Z"<br/>        id             = "b8f25bd9-f045-38b4-9cec-dd887776c3ca"<br/>        ipAddress      = "192.168.1.74"<br/>        macAddress     = "00:e0:4c:00:00:ff"<br/>        name           = "DESKTOP-ABCDE 00:FF"<br/>        type           = "WIRED"<br/>        uplinkDeviceId = "86fec8b1-95f8-3ec3-8dc7-9e5cdf6cd5b3"<br/>      },<br/>      {<br/>        access         = {<br/>          type = "DEFAULT"<br/>        }<br/>        connectedAt    = "2026-02-13T03:35:11Z"<br/>        id             = "250412f8-4682-3d03-b224-1907ba8420ff"<br/>        ipAddress      = "192.168.1.33"<br/>        macAddress     = "d8:c8:0c:00:00:ff"<br/>        name           = "Tuya Smart Socket"<br/>        type           = "WIRELESS"<br/>        uplinkDeviceId = "86fec8b1-95f8-3ec3-8dc7-9e5cdf6cd5b3"<br/>      },<br/>      {<br/>        access         = {<br/>          type = "DEFAULT"<br/>        }<br/>        connectedAt    = "2026-02-13T03:35:11Z"<br/>        id             = "5f1e58ab-17dd-39ae-a52a-4e0b5bc15bda"<br/>        ipAddress      = "192.168.1.144"<br/>        macAddress     = "d8:c8:0c:00:00:ff"<br/>        name           = "Tuya Smart Socket"<br/>        type           = "WIRELESS"<br/>        uplinkDeviceId = "86fec8b1-95f8-3ec3-8dc7-9e5cdf6cd5b3"<br/>      },<br/>      {<br/>        access         = {<br/>          type = "DEFAULT"<br/>        }<br/>        connectedAt    = "2026-02-13T03:35:11Z"<br/>        id             = "5762cc68-f9a9-3929-9df9-60ae56e6275b"<br/>        ipAddress      = "192.168.1.204"<br/>        macAddress     = "d8:1f:12:00:00:ff"<br/>        name           = "Tuya Smart Bulb"<br/>        type           = "WIRELESS"<br/>        uplinkDeviceId = "86fec8b1-95f8-3ec3-8dc7-9e5cdf6cd5b3"<br/>      },<br/>      {<br/>        access         = {<br/>          type = "DEFAULT"<br/>        }<br/>        connectedAt    = "2026-02-13T03:35:11Z"<br/>        id             = "001f56eb-33da-3343-9862-79a44a6c08f7"<br/>        ipAddress      = "192.168.1.233"<br/>        macAddress     = "d8:1f:12:00:00:ff"<br/>        name           = "Tuya Smart Bulb"<br/>        type           = "WIRELESS"<br/>        uplinkDeviceId = "86fec8b1-95f8-3ec3-8dc7-9e5cdf6cd5b3"<br/>      },<br/>    ]<br/>    limit      = 5<br/>    offset     = 0<br/>    totalCount = 18<br/>  }</pre> |
<!-- END_TF_DOCS -->
