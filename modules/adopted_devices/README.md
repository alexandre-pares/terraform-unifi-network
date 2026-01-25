# Adopted Devices Terraform Module

This module list adopted devices for a site managed by your Unifi Network application.

## Examples

- [List Adopted Devices](../../examples/list_adopted_devices)

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
| [restful_resource.adopted_devices](https://registry.terraform.io/providers/magodo/restful/latest/docs/data-sources/resource) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_site_id"></a> [site\_id](#input\_site\_id) | ## Description<br/><br/>  Unifi site Id.<br/><br/>  ## Example<br/><br/>  `4c2d331d-6cdc-39d5-ae48-7457ff007b02`<br/><br/>  ## How to get the site Id<br/><br/>  You can use the `sites` sub-module to get the site id. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_adopted_devices"></a> [adopted\_devices](#output\_adopted\_devices) | ## Description<br/>  List of adopted devices on a site managed by the Unifi Network Application.<br/><br/>  ## Learn more<br/>  https://developer.ui.com/network/v10.1.68/getsiteoverviewpage<br/><br/>  ## Example<pre>hcl<br/>  {<br/>    "offset"      = 0<br/>    "limit"       = 25<br/>    "count"       = 2<br/>    "totalCount"  = 2<br/>    "data"        = [<br/>      {<br/>        "id"                = "c94dadd5-4368-3273-bf77-d45d2e9e0cc1"<br/>        "macAddress"        = "d8:b3:70:ff:ff:ff"<br/>        "ipAddress"         = "192.168.1.10"<br/>        "name"              = "USW Flex 2.5G 5"<br/>        "model"             = "USW Flex 2.5G 5"<br/>        "state"             = "ONLINE"<br/>        "supported"         = true<br/>        "firmwareVersion"   = "2.1.8"<br/>        "firmwareUpdatable" = false<br/>        "features"          = [<br/>          "switching"<br/>        ],<br/>        "interfaces"        = [<br/>          "ports"<br/>        ]<br/>      },<br/>      {<br/>        "id"                = "c06642ce-eff0-395d-b76e-451d2e4ff993"<br/>        "macAddress"        = "94:2a:6f:ff:ff:ff"<br/>        "ipAddress"         = "1.2.3.4" # Looks like the WAN IPv4 (didn't check when having 2 WANs)<br/>        "name"              = "UDR7"<br/>        "model"             = "UDR7"<br/>        "state"             = "ONLINE"<br/>        "supported"         = true<br/>        "firmwareVersion"   = "5.0.12"<br/>        "firmwareUpdatable" = false<br/>        "features"          = [<br/>          "switching",<br/>          "accessPoint"<br/>        ],<br/>        "interfaces"        = [<br/>          "ports",<br/>          "radio"<br/>        ]<br/>      }<br/>    ]<br/>  }</pre> |
<!-- END_TF_DOCS -->
