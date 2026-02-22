# Networks Terraform Module

This module list networks managed by your Unifi Network application.

## Examples

- [List Networks](../../examples/list_networks)

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
| [restful_resource.networks](https://registry.terraform.io/providers/magodo/restful/latest/docs/data-sources/resource) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_query_parameters"></a> [query\_parameters](#input\_query\_parameters) | ## Description<br/><br/>  Query parameters to be sent with the API request.<br/><br/>  ## Example<pre>hcl<br/>  {<br/>    offset = 10<br/>    limit  = 20<br/>    filter = "metadata.origin.eq('USER_DEFINED')"<br/>  }</pre> | <pre>object({<br/>    offset = optional(number)<br/>    limit  = optional(number)<br/>    filter = optional(string)<br/>  })</pre> | `{}` | no |
| <a name="input_site_id"></a> [site\_id](#input\_site\_id) | ## Description<br/><br/>  Unifi site Id.<br/><br/>  ## Example<br/><br/>  `4c2d331d-6cdc-39d5-ae48-7457ff007b02`<br/><br/>  ## How to get the site Id<br/><br/>  You can use the `sites` sub-module to get the site id. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_networks"></a> [networks](#output\_networks) | ## Description<br/><br/>  List of local networks managed by the Unifi Network Application.<br/><br/>  ## Learn more<br/><br/>  https://developer.ui.com/network/v10.1.68/getnetworksoverviewpage<br/><br/>  ## Example<pre>hcl<br/>  {<br/>    offset      = 0,<br/>    limit       = 0,<br/>    count       = 1,<br/>    totalCount  = 1,<br/>    data        = [<br/>      {<br/>        default    = true<br/>        enabled    = true<br/>        id         = "1a25e9d4-8864-49d5-abc4-fffc47905326"<br/>        management = "GATEWAY"<br/>        metadata   = {<br/>            configurable = true<br/>            origin       = "SYSTEM_DEFINED"<br/>        }<br/>        name       = "Default"<br/>        vlanId     = 1<br/>        zoneId     = "b54d3153-7f14-4aaf-9ceb-95a5a08d5519"<br/>      }<br/>    ]<br/>  }</pre> |
<!-- END_TF_DOCS -->
