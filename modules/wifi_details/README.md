# Wifi Broadcast Details Terraform Module

This module retrieve detailed information about a specific Wifi.

## Examples

- [Get Wifi Broadcast Details](../../examples/get_wifi_broadcast_details)

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
| [restful_resource.wifi_broadcast_details](https://registry.terraform.io/providers/magodo/restful/latest/docs/data-sources/resource) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_site_id"></a> [site\_id](#input\_site\_id) | ## Description<br/><br/>  Unifi site Id.<br/><br/>  ## Example<br/><br/>  `4c2d331d-6cdc-39d5-ae48-7457ff007b02`<br/><br/>  ## How to get the site Id<br/><br/>  You can use the `sites` sub-module to get the site id. | `string` | n/a | yes |
| <a name="input_wifi_id"></a> [wifi\_id](#input\_wifi\_id) | ## Description<br/><br/>  Wifi Id.<br/><br/>  ## Example<br/><br/>  `2ef18ba7-616d-45fd-85e0-f5ce03e7f3e6`<br/><br/>  ## How to get the Wifi Id<br/><br/>  You can use the `wifi_broadcasts` sub-module to get the Wifi id. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_wifi_broadcast_details"></a> [wifi\_broadcast\_details](#output\_wifi\_broadcast\_details) | ## Description<br/><br/>  Details about a specific wifi.<br/><br/>  ## Learn more<br/><br/>  https://developer.ui.com/network/v10.1.84/getwifibroadcastdetails<br/><br/>  ## Example<pre>hcl<br/>  {<br/>    advertiseDeviceName                 = false<br/>    arpProxyEnabled                     = true<br/>    bandSteeringEnabled                 = true<br/>    broadcastingFrequenciesGHz          = [<br/>      2.4,<br/>      5,<br/>      6,<br/>    ]<br/>    bssTransitionEnabled                = true<br/>    clientIsolationEnabled              = true<br/>    enabled                             = true<br/>    hideName                            = false<br/>    hotspotConfiguration                = {<br/>      type = "PASSPOINT"<br/>    }<br/>    id                                  = "2ef18ba7-616d-45fd-85e0-f5ce03e7f3e6"<br/>    metadata                            = {<br/>      origin = "USER_DEFINED"<br/>    }<br/>    mloEnabled                          = true<br/>    multicastToUnicastConversionEnabled = false<br/>    name                                = "Orion"<br/>    network                             = {<br/>      networkId = "5810976b-0718-42b9-95da-85261e7eefd2"<br/>      type      = "SPECIFIC"<br/>    }<br/>    securityConfiguration               = {<br/>      coaEnabled          = true<br/>      fastRoamingEnabled  = false<br/>      radiusConfiguration = {<br/>        nasId     = {<br/>          type  = "USER_DEFINED"<br/>          value = "Test"<br/>        }<br/>        profileId = "a0df61b7-e734-40de-9baa-6bae6ee40048"<br/>      }<br/>      securityMode        = "DEFAULT"<br/>      type                = "WPA3_ENTERPRISE"<br/>    }<br/>    type                                = "STANDARD"<br/>    uapsdEnabled                        = false<br/>  }</pre> |
<!-- END_TF_DOCS -->
