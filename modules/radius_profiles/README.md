# Radius Profiles Terraform Module

This module list Radius Profiles managed by your Unifi Network application.

## Examples

- [List Radius Profiles](../../examples/list_radius_profiles)

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
| [restful_resource.radius_profiles](https://registry.terraform.io/providers/magodo/restful/latest/docs/data-sources/resource) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_query_parameters"></a> [query\_parameters](#input\_query\_parameters) | ## Description<br/><br/>  Query parameters to be sent with the API request.<br/><br/>  ## Example<pre>hcl<br/>  {<br/>    offset = 10<br/>    limit  = 20<br/>    filter = "type.eq('IPSEC')"<br/>  }</pre> | <pre>object({<br/>    offset = optional(number)<br/>    limit  = optional(number)<br/>    filter = optional(string)<br/>  })</pre> | `{}` | no |
| <a name="input_site_id"></a> [site\_id](#input\_site\_id) | ## Description<br/><br/>  Unifi site Id.<br/><br/>  ## Example<br/><br/>  `4c2d331d-6cdc-39d5-ae48-7457ff007b02`<br/><br/>  ## How to get the site Id<br/><br/>  You can use the `sites` sub-module to get the site id. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_radius_profiles"></a> [radius\_profiles](#output\_radius\_profiles) | ## Description<br/><br/>  List of Radius Profiles managed by the Unifi Network Application.<br/><br/>  ## Learn more<br/><br/>  https://developer.ui.com/network/v10.1.84/getradiusprofileoverviewpage<br/><br/>  ## Example<pre>hcl<br/>  {<br/>    "count" = 3<br/>    "data" = [<br/>      {<br/>        "id" = "be65ef3f-6ff4-49ff-a470-9af840551e6f"<br/>        "metadata" = {<br/>          "configurable" = true<br/>          "origin" = "SYSTEM_DEFINED"<br/>        }<br/>        "name" = "Default"<br/>      },<br/>      {<br/>        "id" = "8ba565bb-678a-4e02-b600-c0f46fe06a49"<br/>        "metadata" = {<br/>          "origin" = "DERIVED"<br/>        }<br/>        "name" = "UID"<br/>      },<br/>      {<br/>        "id" = "0935d3e6-c705-4bb2-9262-8a0d3eb4d73f"<br/>        "metadata" = {<br/>          "origin" = "USER_DEFINED"<br/>        }<br/>        "name" = "Orion-AAA"<br/>      },<br/>    ]<br/>    "limit" = 20<br/>    "offset" = 0<br/>    "totalCount" = 3<br/>  }</pre> |
<!-- END_TF_DOCS -->
