# WAN Interfaces Terraform Module

This module list WAN interfaces managed by your Unifi Network application.

## Examples

- [List WAN Interfaces](../../examples/list_wan_interfaces)

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
| [restful_resource.wan_interfaces](https://registry.terraform.io/providers/magodo/restful/latest/docs/data-sources/resource) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_query_parameters"></a> [query\_parameters](#input\_query\_parameters) | ## Description<br/><br/>  Query parameters to be sent with the API request.<br/><br/>  ## Example<pre>hcl<br/>  {<br/>    offset = 10<br/>    limit  = 20<br/>  }</pre> | <pre>object({<br/>    offset = optional(number)<br/>    limit  = optional(number)<br/>  })</pre> | `{}` | no |
| <a name="input_site_id"></a> [site\_id](#input\_site\_id) | ## Description<br/><br/>  Unifi site Id.<br/><br/>  ## Example<br/><br/>  `4c2d331d-6cdc-39d5-ae48-7457ff007b02`<br/><br/>  ## How to get the site Id<br/><br/>  You can use the `sites` sub-module to get the site id. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_wan_interfaces"></a> [wan\_interfaces](#output\_wan\_interfaces) | ## Description<br/><br/>  List of WAN interfaces managed by the Unifi Network Application.<br/><br/>  ## Learn more<br/><br/>  https://developer.ui.com/network/v10.1.84/getwansoverviewpage<br/><br/>  ## Example<pre>hcl<br/>  {<br/>    "count" = 2<br/>    "data" = [<br/>      {<br/>        "id" = "bff7d673-b686-467d-8da3-beeb6e806c4a"<br/>        "name" = "SFP+ (WAN1)"<br/>      },<br/>      {<br/>        "id" = "be4327f2-b53a-4812-b3b3-734fae66967c"<br/>        "name" = "Unassigned (WAN2)"<br/>      },<br/>    ]<br/>    "limit" = 25<br/>    "offset" = 0<br/>    "totalCount" = 2<br/>  }</pre> |
<!-- END_TF_DOCS -->
