# Connected Client Details Terraform Module

This module retrieve detailed information about a specific connected client, including name, IP address, MAC address, connection type and access information.

## Examples

- [Get Connected Client Details](../../examples/get_connected_client_details)

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
| [restful_resource.client_details](https://registry.terraform.io/providers/magodo/restful/latest/docs/data-sources/resource) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | ## Description<br/><br/>  Client Id.<br/><br/>  ## Example<br/><br/>  `001f56eb-33da-3343-9862-79a44a6c08f7`<br/><br/>  ## How to get the client Id<br/><br/>  You can use the `clients` sub-module to get the client id. | `string` | n/a | yes |
| <a name="input_site_id"></a> [site\_id](#input\_site\_id) | ## Description<br/><br/>  Unifi site Id.<br/><br/>  ## Example<br/><br/>  `4c2d331d-6cdc-39d5-ae48-7457ff007b02`<br/><br/>  ## How to get the site Id<br/><br/>  You can use the `sites` sub-module to get the site id. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_client_details"></a> [client\_details](#output\_client\_details) | ## Description<br/><br/>  Details about a connected client.<br/><br/>  ## Learn more<br/><br/>  https://developer.ui.com/network/v10.1.84/getconnectedclientdetails<br/><br/>  ## Example<pre>hcl<br/>  {<br/>    access         = {<br/>      type = "DEFAULT"<br/>    }<br/>    connectedAt    = "2026-02-13T03:35:11Z"<br/>    id             = "250412f8-4682-3d03-b224-1907ba8420ff"<br/>    ipAddress      = "192.168.1.33"<br/>    macAddress     = "d8:c8:0c:00:00:ff"<br/>    name           = "Tuya Smart Socket"<br/>    type           = "WIRELESS"<br/>    uplinkDeviceId = "86fec8b1-95f8-3ec3-8dc7-9e5cdf6cd5b3"<br/>  }</pre> |
<!-- END_TF_DOCS -->
