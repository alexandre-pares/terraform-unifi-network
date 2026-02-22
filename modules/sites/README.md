# Sites Terraform Module

This module list sites managed by your Unifi Network application.

## Examples

- [List Local Sites](../../examples/list_local_sites)

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
| [restful_resource.sites](https://registry.terraform.io/providers/magodo/restful/latest/docs/data-sources/resource) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_query_parameters"></a> [query\_parameters](#input\_query\_parameters) | ## Description<br/><br/>  Query parameters to be sent with the API request.<br/><br/>  ## Example<pre>hcl<br/>  {<br/>    offset = 10<br/>    limit  = 20<br/>    filter = "metadata.origin.eq('USER_DEFINED')"<br/>  }</pre> | <pre>object({<br/>    offset = optional(number)<br/>    limit  = optional(number)<br/>    filter = optional(string)<br/>  })</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sites"></a> [sites](#output\_sites) | ## Description<br/><br/>  List of local sites managed by the Unifi Network Application.<br/><br/>  ## Learn more<br/><br/>  https://developer.ui.com/network/v10.1.68/getsiteoverviewpage<br/><br/>  ## Example<pre>hcl<br/>  {<br/>    "offset"      = 0,<br/>    "limit"       = 0,<br/>    "count"       = 1,<br/>    "totalCount"  = 1,<br/>    "data"        = [<br/>      {<br/>        "id"                = "4c2d331d-6cdc-39d5-ae48-7457ff007b02",<br/>        "internalReference" = "default",<br/>        "name"              = "Default"<br/>      }<br/>    ]<br/>  }</pre> |
<!-- END_TF_DOCS -->
