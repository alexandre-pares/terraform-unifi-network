# Site-To-Sites Tunnels Terraform Module

This module list Site-To-Sites Tunnels managed by your Unifi Network application.

## Examples

- [List Site-To-Sites Tunnels](../../examples/list_site_to_site_tunnels)

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
| [restful_resource.site_to_site_tunnels](https://registry.terraform.io/providers/magodo/restful/latest/docs/data-sources/resource) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_query_parameters"></a> [query\_parameters](#input\_query\_parameters) | ## Description<br/><br/>  Query parameters to be sent with the API request.<br/><br/>  ## Example<pre>hcl<br/>  {<br/>    offset = 10<br/>    limit  = 20<br/>    filter = "type.eq('IPSEC')"<br/>  }</pre> | <pre>object({<br/>    offset = optional(number)<br/>    limit  = optional(number)<br/>    filter = optional(string)<br/>  })</pre> | `{}` | no |
| <a name="input_site_id"></a> [site\_id](#input\_site\_id) | ## Description<br/><br/>  Unifi site Id.<br/><br/>  ## Example<br/><br/>  `4c2d331d-6cdc-39d5-ae48-7457ff007b02`<br/><br/>  ## How to get the site Id<br/><br/>  You can use the `sites` sub-module to get the site id. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_site_to_site_tunnels"></a> [site\_to\_site\_tunnels](#output\_site\_to\_site\_tunnels) | ## Description<br/><br/>  List of Site-To-Sites Tunnels managed by the Unifi Network Application.<br/><br/>  ## Learn more<br/><br/>  https://developer.ui.com/network/v10.1.84/getsitetositevpntunnelpage<br/><br/>  ## Example<pre>hcl<br/>  {<br/>    "count" = 2<br/>    "data" = [<br/>      {<br/>        "id" = "89fbdf21-6f51-4869-858e-87439799af4b"<br/>        "metadata" = {<br/>          "origin" = "USER_DEFINED"<br/>        }<br/>        "name" = "azure_1"<br/>        "type" = "IPSEC"<br/>      },<br/>      {<br/>        "id" = "cfcd560b-cdeb-46d2-9415-98082d39b6a3"<br/>        "metadata" = {<br/>          "origin" = "USER_DEFINED"<br/>        }<br/>        "name" = "azure_2"<br/>        "type" = "IPSEC"<br/>      },<br/>    ]<br/>    "limit" = 25<br/>    "offset" = 0<br/>    "totalCount" = 2<br/>  }</pre> |
<!-- END_TF_DOCS -->
