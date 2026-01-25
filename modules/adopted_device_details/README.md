# Adopted Device Details Terraform Module

This module return details about an adopted device linked to a sites managed by your Unifi Network application.

## Examples

- [get_adopted_device_details](../../examples/get_adopted_device_details/README.md)

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
| [restful_resource.adopted_device_details](https://registry.terraform.io/providers/magodo/restful/latest/docs/data-sources/resource) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_device_id"></a> [device\_id](#input\_device\_id) | ## Description<br/><br/>  Device Id.<br/><br/>  ## Example<br/><br/>  `c94dadd5-4368-3273-bf77-d45d2e9e0cc1`<br/><br/>  ## How to get the device Id<br/><br/>  You can use the `adopted_devices` sub-module to get the device id. | `string` | n/a | yes |
| <a name="input_site_id"></a> [site\_id](#input\_site\_id) | ## Description<br/><br/>  Unifi site Id.<br/><br/>  ## Example<br/><br/>  `4c2d331d-6cdc-39d5-ae48-7457ff007b02`<br/><br/>  ## How to get the site Id<br/><br/>  You can use the `sites` sub-module to get the site id. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_adopted_device_details"></a> [adopted\_device\_details](#output\_adopted\_device\_details) | ## Description<br/><br/>  Details about an adopted device.<br/><br/>  ## Learn more<br/><br/>  https://developer.ui.com/network/v10.1.68/getadopteddevicedetails<br/><br/>  ## Example<pre>hcl<br/>  {<br/>    "id"                = "c94dadd5-4368-3273-bf77-d45d2e9e0cc1"<br/>    "macAddress"        = "d8:b3:70:ff:ff:ff"<br/>    "ipAddress"         = "192.168.1.10"<br/>    "name"              = "USW Flex 2.5G 5"<br/>    "model"             = "USW Flex 2.5G 5"<br/>    "supported"         = true<br/>    "state"             = "ONLINE"<br/>    "firmwareVersion"   = "2.1.8"<br/>    "firmwareUpdatable" = false<br/>    "adoptedAt"         = "2025-11-19T22:34:26Z"<br/>    "provisionedAt"     = "2025-12-22T12:55:26Z"<br/>    "configurationId"   = "1a2b3c4d5e6f"<br/>    "uplink"            = {<br/>      "deviceId" = "c06642ce-eff0-395d-b76e-451d2e4ff993"<br/>    },<br/>    "features"          = {<br/>      "switching"   = {},<br/>      "accessPoint" = {}<br/>    },<br/>    "interfaces"        = {<br/>      "ports" = [<br/>        {<br/>          "idx"           = 1,<br/>          "state"         = "UP",<br/>          "connector"     = "RJ45",<br/>          "maxSpeedMbps"  = 2500,<br/>          "speedMbps"     = 2500<br/>        },<br/>        {<br/>          "idx"           = 2,<br/>          "state"         = "UP",<br/>          "connector"     = "RJ45",<br/>          "maxSpeedMbps"  = 2500,<br/>          "speedMbps"     = 2500<br/>        },<br/>        {<br/>          "idx"           = 3,<br/>          "state"         = "DOWN",<br/>          "connector"     = "RJ45",<br/>          "maxSpeedMbps"  = 2500,<br/>        },<br/>        {<br/>          "idx"           = 3,<br/>          "state"         = "DOWN",<br/>          "connector"     = "RJ45",<br/>          "maxSpeedMbps"  = 2500<br/>        },<br/>        {<br/>          "idx"           = 4,<br/>          "state"         = "DOWN",<br/>          "connector"     = "RJ45",<br/>          "maxSpeedMbps"  = 2500<br/>        },<br/>        {<br/>          "idx"           = 5,<br/>          "state"         = "DOWN",<br/>          "connector"     = "RJ45",<br/>          "maxSpeedMbps"  = 2500<br/>        }<br/>      ]<br/>    }<br/>  }</pre> |
<!-- END_TF_DOCS -->
