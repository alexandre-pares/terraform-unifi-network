output "wifi_broadcast_details" {
  description = <<DESCRIPTION
  ## Description

  Details about a specific wifi.

  ## Learn more

  https://developer.ui.com/network/v10.1.84/getwifibroadcastdetails

  ## Example

  ```hcl
  {
    advertiseDeviceName                 = false
    arpProxyEnabled                     = true
    bandSteeringEnabled                 = true
    broadcastingFrequenciesGHz          = [
      2.4,
      5,
      6,
    ]
    bssTransitionEnabled                = true
    clientIsolationEnabled              = true
    enabled                             = true
    hideName                            = false
    hotspotConfiguration                = {
      type = "PASSPOINT"
    }
    id                                  = "2ef18ba7-616d-45fd-85e0-f5ce03e7f3e6"
    metadata                            = {
      origin = "USER_DEFINED"
    }
    mloEnabled                          = true
    multicastToUnicastConversionEnabled = false
    name                                = "Orion"
    network                             = {
      networkId = "5810976b-0718-42b9-95da-85261e7eefd2"
      type      = "SPECIFIC"
    }
    securityConfiguration               = {
      coaEnabled          = true
      fastRoamingEnabled  = false
      radiusConfiguration = {
        nasId     = {
          type  = "USER_DEFINED"
          value = "Test"
        }
        profileId = "a0df61b7-e734-40de-9baa-6bae6ee40048"
      }
      securityMode        = "DEFAULT"
      type                = "WPA3_ENTERPRISE"
    }
    type                                = "STANDARD"
    uapsdEnabled                        = false
  }
  ```

  DESCRIPTION

  value = data.restful_resource.wifi_broadcast_details.output
}
