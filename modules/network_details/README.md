# Network Details Terraform Module

This module return details about a network linked to a sites managed by your Unifi Network application.

## Examples

- [Get Network Details](../../examples/get_network_details)

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
| [restful_resource.network_details](https://registry.terraform.io/providers/magodo/restful/latest/docs/data-sources/resource) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_network_id"></a> [network\_id](#input\_network\_id) | ## Description<br/><br/>  Network Id.<br/><br/>  ## Example<br/><br/>  `1a25e9d4-8864-49d5-abc4-fffc47905326`<br/><br/>  ## How to get the network Id<br/><br/>  You can use the `networks` sub-module to get the network id. | `string` | n/a | yes |
| <a name="input_site_id"></a> [site\_id](#input\_site\_id) | ## Description<br/><br/>  Unifi site Id.<br/><br/>  ## Example<br/><br/>  `4c2d331d-6cdc-39d5-ae48-7457ff007b02`<br/><br/>  ## How to get the site Id<br/><br/>  You can use the `sites` sub-module to get the site id. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_details"></a> [network\_details](#output\_network\_details) | ## Description<br/><br/>  Details about a network.<br/><br/>  ## Learn more<br/><br/>  https://developer.ui.com/network/v10.1.68/getnetworkdetails<br/><br/>  ## Example<pre>hcl<br/>  {<br/>    cellularBackupEnabled = false<br/>    default               = true<br/>    enabled               = true<br/>    id                    = "1a25e9d4-8864-49d5-abc4-fffc47905326"<br/>    internetAccessEnabled = true<br/>    ipv4Configuration     = {<br/>      autoScaleEnabled  = true<br/>      dhcpConfiguration = {<br/>          domainName                   = "local-domain.tld"<br/>          ipAddressRange               = {<br/>              start = "192.168.1.6"<br/>              stop  = "192.168.1.254"<br/>            }<br/>          leaseTimeSeconds             = 86400<br/>          mode                         = "SERVER"<br/>          pingConflictDetectionEnabled = true<br/>        }<br/>      hostIpAddress     = "192.168.1.1"<br/>      prefixLength      = 24<br/>    }<br/>  ipv6Configuration     = {<br/>    clientAddressAssignment        = {<br/>      slaacEnabled = true<br/>    }<br/>    interfaceType                  = "PREFIX_DELEGATION"<br/>    prefixDelegationWanInterfaceId = "d7a6a629-5696-4140-ae5f-50a29bc04061"<br/>    routerAdvertisement            = {<br/>      priority = "HIGH"<br/>    }<br/>    }<br/>    isolationEnabled      = false<br/>    management            = "GATEWAY"<br/>    mdnsForwardingEnabled = true<br/>    metadata              = {<br/>      configurable = true<br/>      origin       = "SYSTEM_DEFINED"<br/>    }<br/>    name                  = "Default"<br/>    vlanId                = 1<br/>    zoneId                = "b54d3153-7f14-4aaf-9ceb-95a5a08d5519"<br/>  }</pre> |
<!-- END_TF_DOCS -->
