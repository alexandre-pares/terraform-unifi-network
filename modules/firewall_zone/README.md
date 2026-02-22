# Network Terraform Module

This module manage a single firewall zone managed by your Unifi Network application.

## Examples

- [Create Firewall Zones](../../examples/create_firewall_zones)

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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_firewall_zone_details"></a> [firewall\_zone\_details](#module\_firewall\_zone\_details) | ../../modules/firewall_zone_details | n/a |

## Resources

| Name | Type |
|------|------|
| [restful_resource.firewall_zone](https://registry.terraform.io/providers/magodo/restful/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | ## Description<br/><br/>  Name of the firewall zone<br/><br/>  ## Example<br/><br/>  `Internal_custom` | `string` | n/a | yes |
| <a name="input_network_ids"></a> [network\_ids](#input\_network\_ids) | ## Description<br/><br/>  List of network id to attach to the firewall zone.<br/><br/>  ## Example<pre>hcl<br/>  [<br/>    "023e8518-9baf-4b0d-8a2a-a89449023e9e",<br/>    "529e1d59-0baa-4353-a1e6-3aca4297eea1"<br/>  ]</pre>## Default<br/><br/>  `[]` | `list(string)` | `[]` | no |
| <a name="input_site_id"></a> [site\_id](#input\_site\_id) | ## Description<br/><br/>  Unifi site Id.<br/><br/>  ## Example<br/><br/>  `4c2d331d-6cdc-39d5-ae48-7457ff007b02`<br/><br/>  ## How to get the site Id<br/><br/>  You can use the `sites` sub-module to get the site id. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_firewall_zone_details"></a> [firewall\_zone\_details](#output\_firewall\_zone\_details) | ## Description<br/><br/>  Details about a firewall zone.<br/><br/>  ## Learn more<br/><br/>  https://developer.ui.com/network/v10.1.84/getfirewallzone<br/><br/>  ## Example<pre>hcl<br/>  {<br/>    id         = "5aa9437d-7d50-425f-bfaf-d3d6bd487a87"<br/>    metadata   = {<br/>      configurable = false<br/>      origin       = "SYSTEM_DEFINED"<br/>    }<br/>    name       = "Vpn"<br/>    networkIds = [<br/>      "3cacfc0f-e5a0-4958-adb9-901e6a090a92",<br/>      "ccf067c6-fb2c-4a24-b9b2-f209b489a0f7",<br/>      "c43cbc22-fa89-493e-b38f-9e4a720b9bb3",<br/>      "a4df7e6d-09dd-4476-8311-1f0298b00831",<br/>    ]<br/>  }</pre> |
<!-- END_TF_DOCS -->
