# VPN Servers Terraform Module

This module list VPN Servers managed by your Unifi Network application.

## Examples

- [List VPN Servers](../../examples/list_vpn_servers)

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
| [restful_resource.vpn_servers](https://registry.terraform.io/providers/magodo/restful/latest/docs/data-sources/resource) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_query_parameters"></a> [query\_parameters](#input\_query\_parameters) | ## Description<br/><br/>  Query parameters to be sent with the API request.<br/><br/>  ## Example<pre>hcl<br/>  {<br/>    offset = 10<br/>    limit  = 20<br/>    filter = "type.eq('WIREGUARD')"<br/>  }</pre> | <pre>object({<br/>    offset = optional(number)<br/>    limit  = optional(number)<br/>    filter = optional(string)<br/>  })</pre> | `{}` | no |
| <a name="input_site_id"></a> [site\_id](#input\_site\_id) | ## Description<br/><br/>  Unifi site Id.<br/><br/>  ## Example<br/><br/>  `4c2d331d-6cdc-39d5-ae48-7457ff007b02`<br/><br/>  ## How to get the site Id<br/><br/>  You can use the `sites` sub-module to get the site id. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpn_servers"></a> [vpn\_servers](#output\_vpn\_servers) | ## Description<br/><br/>  List of VPN Servers managed by the Unifi Network Application.<br/><br/>  ## Learn more<br/><br/>  https://developer.ui.com/network/v10.1.84/getvpnserverpage<br/><br/>  ## Example<pre>hcl<br/>  {<br/>    "count" = 1<br/>    "data" = [<br/>      {<br/>        "enabled" = true<br/>        "id" = "d8f62b6a-4c4a-4dcb-8ca4-bf957433940e"<br/>        "metadata" = {<br/>          "origin" = "USER_DEFINED"<br/>        }<br/>        "name" = "One-Click VPN"<br/>        "type" = "WIREGUARD"<br/>      },<br/>    ]<br/>    "limit" = 20<br/>    "offset" = 0<br/>    "totalCount" = 1<br/>  }</pre> |
<!-- END_TF_DOCS -->
