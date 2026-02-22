# DPI Application Categories Terraform Module

This module list DPI Application Categories managed by your Unifi Network application.

## Examples

- [List DPI Application Categories](../../examples/list_dpi_application_categories)

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
| [restful_resource.dpi_application_categories](https://registry.terraform.io/providers/magodo/restful/latest/docs/data-sources/resource) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_query_parameters"></a> [query\_parameters](#input\_query\_parameters) | ## Description<br/><br/>  Query parameters to be sent with the API request.<br/><br/>  ## Example<pre>hcl<br/>  {<br/>    offset = 10<br/>    limit  = 20<br/>    filter = "name.like('*tools*')"<br/>  }</pre> | <pre>object({<br/>    offset = optional(number)<br/>    limit  = optional(number)<br/>    filter = optional(string)<br/>  })</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dpi_application_categories"></a> [dpi\_application\_categories](#output\_dpi\_application\_categories) | ## Description<br/><br/>  List of DPI Application Categories managed by the Unifi Network Application.<br/><br/>  ## Learn more<br/><br/>  https://developer.ui.com/network/v10.1.84/getdpiapplicationcategories<br/><br/>  ## Example<pre>hcl<br/>  {<br/>    "count" = 20<br/>    "data" = [<br/>      {<br/>        "id" = 0<br/>        "name" = "Instant messengers"<br/>      },<br/>      {<br/>        "id" = 1<br/>        "name" = "Peer-to-peer networks"<br/>      },<br/>      {<br/>        "id" = 3<br/>        "name" = "File sharing services and tools"<br/>      },<br/>      {<br/>        "id" = 4<br/>        "name" = "Media streaming services"<br/>      },<br/>      {<br/>        "id" = 5<br/>        "name" = "Email messaging services"<br/>      },<br/>      {<br/>        "id" = 6<br/>        "name" = "VoIP services"<br/>      },<br/>      {<br/>        "id" = 7<br/>        "name" = "Database tools"<br/>      },<br/>      {<br/>        "id" = 8<br/>        "name" = "Online games"<br/>      },<br/>      {<br/>        "id" = 9<br/>        "name" = "Management tools and protocols"<br/>      },<br/>      {<br/>        "id" = 10<br/>        "name" = "Remote access terminals"<br/>      },<br/>      {<br/>        "id" = 11<br/>        "name" = "Tunneling and proxy services"<br/>      },<br/>      {<br/>        "id" = 12<br/>        "name" = "Investment platforms"<br/>      },<br/>      {<br/>        "id" = 13<br/>        "name" = "Web services"<br/>      },<br/>      {<br/>        "id" = 14<br/>        "name" = "Security update tools"<br/>      },<br/>      {<br/>        "id" = 15<br/>        "name" = "Web instant messengers"<br/>      },<br/>      {<br/>        "id" = 17<br/>        "name" = "Business tools"<br/>      },<br/>      {<br/>        "id" = 18<br/>        "name" = "Network protocols"<br/>      },<br/>      {<br/>        "id" = 19<br/>        "name" = "Network protocols"<br/>      },<br/>      {<br/>        "id" = 20<br/>        "name" = "Network protocols"<br/>      },<br/>      {<br/>        "id" = 22<br/>        "name" = "Adult"<br/>      },<br/>    ]<br/>    "limit" = 20<br/>    "offset" = 0<br/>    "totalCount" = 35<br/>  }</pre> |
<!-- END_TF_DOCS -->
