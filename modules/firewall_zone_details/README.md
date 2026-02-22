# Firewall Zone Details Terraform Module

This module return details about a firewall zone linked to a sites managed by your Unifi Network application.

## Examples

- [Get Firewall Zone Details](../../examples/get_firewall_zone_details)

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
| [restful_resource.firewall_zone_details](https://registry.terraform.io/providers/magodo/restful/latest/docs/data-sources/resource) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_firewall_zone_id"></a> [firewall\_zone\_id](#input\_firewall\_zone\_id) | ## Description<br/><br/>  Firewall Zone Id.<br/><br/>  ## Example<br/><br/>  `3696e479-13b4-4aaa-aa74-093bbff7f45a`<br/><br/>  ## How to get the firewall zone Id<br/><br/>  You can use the `firewall_zones` sub-module to get the firewall zone id. | `string` | n/a | yes |
| <a name="input_site_id"></a> [site\_id](#input\_site\_id) | ## Description<br/><br/>  Unifi site Id.<br/><br/>  ## Example<br/><br/>  `4c2d331d-6cdc-39d5-ae48-7457ff007b02`<br/><br/>  ## How to get the site Id<br/><br/>  You can use the `sites` sub-module to get the site id. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_firewall_zone_details"></a> [firewall\_zone\_details](#output\_firewall\_zone\_details) | ## Description<br/><br/>  Details about a firewall zone.<br/><br/>  ## Learn more<br/><br/>  https://developer.ui.com/network/v10.1.84/getfirewallzone<br/><br/>  ## Example<pre>hcl<br/>  {<br/>    id         = "5aa9437d-7d50-425f-bfaf-d3d6bd487a87"<br/>    metadata   = {<br/>      configurable = false<br/>      origin       = "SYSTEM_DEFINED"<br/>    }<br/>    name       = "Vpn"<br/>    networkIds = [<br/>      "3cacfc0f-e5a0-4958-adb9-901e6a090a92",<br/>      "ccf067c6-fb2c-4a24-b9b2-f209b489a0f7",<br/>      "c43cbc22-fa89-493e-b38f-9e4a720b9bb3",<br/>      "a4df7e6d-09dd-4476-8311-1f0298b00831",<br/>    ]<br/>  }</pre> |
<!-- END_TF_DOCS -->
