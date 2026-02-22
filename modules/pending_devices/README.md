# Devices Pending Adoption Terraform Module

This module list devices pending adoption for an Unifi Network application.

## Examples

- [List Devices Pending Adoption](../../examples/list_devices_pending_adoption)

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
| [restful_resource.pending_devices_adoption](https://registry.terraform.io/providers/magodo/restful/latest/docs/data-sources/resource) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_query_parameters"></a> [query\_parameters](#input\_query\_parameters) | ## Description<br/><br/>  Query parameters to be sent with the API request.<br/><br/>  ## Example<pre>hcl<br/>  {<br/>    offset = 10<br/>    limit  = 20<br/>    filter = "model.eq('USW Flex 2.5G 5')"<br/>  }</pre> | <pre>object({<br/>    offset = optional(number)<br/>    limit  = optional(number)<br/>    filter = optional(string)<br/>  })</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_pending_devices_adoption"></a> [pending\_devices\_adoption](#output\_pending\_devices\_adoption) | ## Description<br/><br/>  List of devices pending adoption on an Unifi Network Application.<br/><br/>  ## Learn more<br/><br/>  https://developer.ui.com/network/v10.1.68/getpendingdevicepage<br/><br/>  ## Example<br/><br/>  ### 1 device pending adoption<pre>hcl<br/>  {<br/>    "offset"      = 0<br/>    "limit"       = 25<br/>    "count"       = 0<br/>    "totalCount"  = 0<br/>    "data"        = [<br/>      {<br/>        adoptionTargetSiteIds = [<br/>            "4c2d331d-6cdc-39d5-ae48-7457ff007b02",<br/>          ]<br/>        features              = [<br/>            "switching",<br/>          ]<br/>        firmwareUpdatable     = false<br/>        firmwareVersion       = "2.1.8"<br/>        ipAddress             = "192.168.1.10"<br/>        macAddress            = "84:78:48:ff:ff:ff"<br/>        model                 = "USW Flex 2.5G 5"<br/>        state                 = "PENDING_ADOPTION"<br/>        supported             = true<br/>      }<br/>    ]<br/>  }</pre>### No devices pending adoption<pre>hcl<br/>  {<br/>    "offset"      = 0<br/>    "limit"       = 25<br/>    "count"       = 0<br/>    "totalCount"  = 0<br/>    "data"        = []<br/>  }</pre> |
<!-- END_TF_DOCS -->
