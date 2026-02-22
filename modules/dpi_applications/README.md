# DPI Applications Terraform Module

This module list DPI Applications managed by your Unifi Network application.

## Examples

- [List DPI Applications](../../examples/list_dpi_applications)

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
| [restful_resource.dpi_applications](https://registry.terraform.io/providers/magodo/restful/latest/docs/data-sources/resource) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_query_parameters"></a> [query\_parameters](#input\_query\_parameters) | ## Description<br/><br/>  Query parameters to be sent with the API request.<br/><br/>  ## Example<pre>hcl<br/>  {<br/>    offset = 10<br/>    limit  = 20<br/>    filter = "name.like('*Apple*')"<br/>  }</pre> | <pre>object({<br/>    offset = optional(number)<br/>    limit  = optional(number)<br/>    filter = optional(string)<br/>  })</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dpi_applications"></a> [dpi\_applications](#output\_dpi\_applications) | ## Description<br/><br/>  List of DPI Applications managed by the Unifi Network Application.<br/><br/>  ## Learn more<br/><br/>  https://developer.ui.com/network/v10.1.84/getdpiapplications<br/><br/>  ## Example<pre>hcl<br/>  {<br/>    "count" = 20<br/>    "data" = [<br/>      {<br/>        "id" = 3<br/>        "name" = "ICQ"<br/>      },<br/>      {<br/>        "id" = 4<br/>        "name" = "QQ/TM"<br/>      },<br/>      {<br/>        "id" = 5<br/>        "name" = "DingTalk"<br/>      },<br/>      {<br/>        "id" = 6<br/>        "name" = "IRC"<br/>      },<br/>      {<br/>        "id" = 10<br/>        "name" = "Gadu-Gadu"<br/>      },<br/>      {<br/>        "id" = 11<br/>        "name" = "Yixin"<br/>      },<br/>      {<br/>        "id" = 12<br/>        "name" = "POPO"<br/>      },<br/>      {<br/>        "id" = 14<br/>        "name" = "Wlt"<br/>      },<br/>      {<br/>        "id" = 16<br/>        "name" = "Omegle"<br/>      },<br/>      {<br/>        "id" = 17<br/>        "name" = "IPMSG"<br/>      },<br/>      {<br/>        "id" = 18<br/>        "name" = "AliWW"<br/>      },<br/>      {<br/>        "id" = 19<br/>        "name" = "Mail.ru IM"<br/>      },<br/>      {<br/>        "id" = 21<br/>        "name" = "Lava-Lava"<br/>      },<br/>      {<br/>        "id" = 22<br/>        "name" = "Paltalk"<br/>      },<br/>      {<br/>        "id" = 24<br/>        "name" = "WinpopupX"<br/>      },<br/>      {<br/>        "id" = 27<br/>        "name" = "Apple iMessage"<br/>      },<br/>      {<br/>        "id" = 29<br/>        "name" = "iSpQ"<br/>      },<br/>      {<br/>        "id" = 30<br/>        "name" = "Momo"<br/>      },<br/>      {<br/>        "id" = 32<br/>        "name" = "Caihong"<br/>      },<br/>      {<br/>        "id" = 34<br/>        "name" = "IMVU"<br/>      },<br/>    ]<br/>    "limit" = 20<br/>    "offset" = 0<br/>    "totalCount" = 2112<br/>  }</pre> |
<!-- END_TF_DOCS -->
