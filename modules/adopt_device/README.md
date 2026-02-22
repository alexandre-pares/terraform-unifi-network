# Adopt Device Terraform Module

This module adopts devices pending adoption for an Unifi Network application.

## Examples

- [Adopt Device](../../examples/adopt_device)

## Limitations

N/A

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.14 |
| <a name="requirement_restful"></a> [restful](#requirement\_restful) | ~> 0.25 |

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ignore_device_limit"></a> [ignore\_device\_limit](#input\_ignore\_device\_limit) | ## Description<br/><br/>  Whether to ignore the device limit when adopting a new device.<br/><br/>  ## Example<br/><br/>  `true` | `bool` | `false` | no |
| <a name="input_mac_address"></a> [mac\_address](#input\_mac\_address) | ## Description<br/><br/>  MAC address of the device to be adopted.<br/><br/>  ## Example<br/><br/>  `d8:b3:70:ff:ff:ff` | `string` | n/a | yes |
| <a name="input_site_id"></a> [site\_id](#input\_site\_id) | ## Description<br/><br/>  Unifi site Id.<br/><br/>  ## Example<br/><br/>  `4c2d331d-6cdc-39d5-ae48-7457ff007b02`<br/><br/>  ## How to get the site Id<br/><br/>  You can use the `sites` sub-module to get the site id. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
