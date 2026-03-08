output "wifi_broadcasts" {
  description = <<DESCRIPTION
  ## Description

  List of wifi broadcasts managed by the Unifi Network Application.

  ## Learn more

  https://developer.ui.com/network/v10.1.84/getwifibroadcastpage

  ## Example

  ```hcl
  {
    count      = 2
    data       = [
      {
        broadcastingFrequenciesGHz = [
          2.4,
          5,
          6,
        ]
        enabled                    = true
        hotspotConfiguration       = {}
        id                         = "2ef18ba7-616d-45fd-85e0-f5ce03e7f3e6"
        metadata                   = {
          origin = "USER_DEFINED"
        }
        name                       = "Orion"
        network                    = {
          networkId = "5810976b-0718-42b9-95da-85261e7eefd2"
          type      = "SPECIFIC"
        }
        securityConfiguration      = {
          type = "WPA3_ENTERPRISE"
        }
        type                       = "STANDARD"
      },
      {
        broadcastingFrequenciesGHz = [
          2.4,
          5,
          6,
        ]
        enabled                    = true
        id                         = "fd3c4c5c-b7c5-4cdc-ad10-767ed6c6f12e"
        metadata                   = {
          origin = "USER_DEFINED"
        }
        name                       = "Identity"
        network                    = {
          type = "NATIVE"
        }
        securityConfiguration      = {
          type = "WPA3_ENTERPRISE"
        }
        type                       = "STANDARD"
      },
    ]
    limit      = 10
    offset     = 0
    totalCount = 2
  }
  ```

  DESCRIPTION

  value = data.restful_resource.wifi_broadcasts.output
}
