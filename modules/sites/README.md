# Sites Terraform Module

This module list sites managed by your Unifi Network application.

## Examples

- [List Local Sites](../../examples/list_local_sites)

## Limitations

- `offset` not supported
- `limit` not supported
- `filter` not supported

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

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sites"></a> [sites](#output\_sites) | ## Description<br/>  List of local sites managed by the Unifi Network Application.<br/><br/>  ## Learn more<br/>  https://developer.ui.com/network/v10.1.68/getsiteoverviewpage<br/><br/>  ## Example<pre>hcl<br/>  {<br/>    "offset"      = 0,<br/>    "limit"       = 0,<br/>    "count"       = 1,<br/>    "totalCount"  = 1,<br/>    "data"        = [<br/>      {<br/>        "id"                = "4c2d331d-6cdc-39d5-ae48-7457ff007b02",<br/>        "internalReference" = "default",<br/>        "name"              = "Default"<br/>      }<br/>    ]<br/>  }</pre> |
<!-- END_TF_DOCS -->
