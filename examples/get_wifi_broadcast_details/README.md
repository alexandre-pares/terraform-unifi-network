# Example: Get Wifi Broadcast Details

Retrieve detailed information about a specific Wifi.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.14 |
| <a name="requirement_restful"></a> [restful](#requirement\_restful) | ~> 0.25 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_clients"></a> [clients](#module\_clients) | ../../modules/clients | n/a |
| <a name="module_sites"></a> [sites](#module\_sites) | ../../modules/sites | n/a |
| <a name="module_wifi_broadcast_details"></a> [wifi\_broadcast\_details](#module\_wifi\_broadcast\_details) | ../../modules/wifi_details | n/a |
| <a name="module_wifi_broadcasts"></a> [wifi\_broadcasts](#module\_wifi\_broadcasts) | ../../modules/wifis | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_key"></a> [api\_key](#input\_api\_key) | ## Description<br/><br/>  Unifi Network API Key.<br/>  Please note that API key generated from the Unifi Site Manager can only be used on the remote API endpoint<br/>  and API key generated from the location Unifi Console can only be used on the local API endpoint.<br/><br/>  ## Create an Remote API Key<br/><br/>  To create a remote API key follow the instructions below:<br/>  1. Login to your Unifi Site Manager<br/>  2. Navigate to Settings > API Keys<br/>  3. (Optional) If you have multiples Fabrics (Previously called Organizations), select the desired Fabric from the dropdown or select "Independent Sites"<br/>  4. Click on "Create New API Key"<br/>  5. Provide a name (e.g. `tf-unifi-network`) and check "Unifi Applications"<br/>  6. Under "Expiration", select the desired expiration (e.g. `1 Month`)<br/>  7. Under Applications, select "Network"<br/>  8. (Optional) Under "Sites", select specific sites or leave it to "All"<br/>  9. Click on "Create" and copy the generated API Key<br/><br/>  ## Create a Local API Key<br/>  To create a local API key follow the instructions below:<br/>  1. Login to your Unifi Console using the local IP<br/>  2. Navigate to Integrations<br/>  3. Click on "Create New API Key"<br/>  4. Provide a name (e.g. `tf-local-unifi-network`)<br/>  5. (Optional) Provide a description<br/>  6. Under "Expiration", select the desired expiration (e.g. `1 Month`)<br/>  7. Click on "Create" and copy the generated API Key<br/><br/>  ## Security Note<br/><br/>  Never share your API key publicly (or commit it to GitHub). | `string` | n/a | yes |
| <a name="input_console_id"></a> [console\_id](#input\_console\_id) | ## Description<br/><br/>  Unifi Console ID.<br/><br/>  This is only required if `var.endpoint_type` is  `remote`.<br/><br/>  ## Example<br/><br/>  `<br/><br/>` | `string` | `""` | no |
| <a name="input_console_ip"></a> [console\_ip](#input\_console\_ip) | ## Description<br/><br/>  (local) IP Address of your Unifi Console.<br/>  This is only required if `var.endpoint_type` is `local`.<br/><br/>  ## Example<br/><br/>  `192.168.0.1` | `string` | `""` | no |
| <a name="input_endpoint_type"></a> [endpoint\_type](#input\_endpoint\_type) | ## Description<br/><br/>  Type of endpoint to use for API requests to your Unifi Console.<br/><br/>  Available options are:<br/><br/>  - `remote`: Use the Unifi API as a proxy to connect to your Unifi Console. This is the preferred method if you don't have a direct connection to your Unifi Console.<br/>  - `local`: Use a direct connection to your Unifi Console. This is the preferred method if you have a direct connection to your Unifi Console.<br/><br/>  ## Example<br/><br/>  `remote`<br/>  `local` | `string` | `"remote"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_wifi_broadcast_details"></a> [wifi\_broadcast\_details](#output\_wifi\_broadcast\_details) | ## Description<br/><br/>  Details about a specific wifi.<br/><br/>  ## Learn more<br/><br/>  https://developer.ui.com/network/v10.1.84/getwifibroadcastdetails<br/><br/>  ## Example<pre>hcl<br/>  {<br/>    advertiseDeviceName                 = false<br/>    arpProxyEnabled                     = true<br/>    bandSteeringEnabled                 = true<br/>    broadcastingFrequenciesGHz          = [<br/>      2.4,<br/>      5,<br/>      6,<br/>    ]<br/>    bssTransitionEnabled                = true<br/>    clientIsolationEnabled              = true<br/>    enabled                             = true<br/>    hideName                            = false<br/>    hotspotConfiguration                = {<br/>      type = "PASSPOINT"<br/>    }<br/>    id                                  = "2ef18ba7-616d-45fd-85e0-f5ce03e7f3e6"<br/>    metadata                            = {<br/>      origin = "USER_DEFINED"<br/>    }<br/>    mloEnabled                          = true<br/>    multicastToUnicastConversionEnabled = false<br/>    name                                = "Orion"<br/>    network                             = {<br/>      networkId = "5810976b-0718-42b9-95da-85261e7eefd2"<br/>      type      = "SPECIFIC"<br/>    }<br/>    securityConfiguration               = {<br/>      coaEnabled          = true<br/>      fastRoamingEnabled  = false<br/>      radiusConfiguration = {<br/>        nasId     = {<br/>          type  = "USER_DEFINED"<br/>          value = "Test"<br/>        }<br/>        profileId = "a0df61b7-e734-40de-9baa-6bae6ee40048"<br/>      }<br/>      securityMode        = "DEFAULT"<br/>      type                = "WPA3_ENTERPRISE"<br/>    }<br/>    type                                = "STANDARD"<br/>    uapsdEnabled                        = false<br/>  }</pre> |
<!-- END_TF_DOCS -->
