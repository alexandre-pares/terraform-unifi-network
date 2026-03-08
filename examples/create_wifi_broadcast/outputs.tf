output "default_unifi_site" {
  description = <<DESCRIPTION
  ## Description

  List of local sites managed by the Unifi Network Application.

  ## Learn more

  https://developer.ui.com/network/v10.1.68/getsiteoverviewpage

  ## Example

  ```hcl
  [
    {
      "id"                = "4c2d331d-6cdc-39d5-ae48-7457ff007b02",
      "internalReference" = "default",
      "name"              = "Default"
    }
  ]
  ```

  DESCRIPTION

  value = module.default_sites.sites["data"]
}

output "hotspot_firewall_zone" {
  description = <<DESCRIPTION
  ## Description

  Hotspot firewall Zones details.

  ## Learn more

  https://developer.ui.com/network/v10.1.68/getfirewallzones

  ## Example

  ```hcl
  {
    id         = "364c92e1-c819-4d07-a402-221903cb4a94"
    metadata   = {
      configurable = true
      origin       = "SYSTEM_DEFINED"
    }
    name       = "Hotspot"
    networkIds = [
      "2f6579e9-bf02-4c73-9308-0253d67a85d3",
    ]
  }
  ```

  DESCRIPTION

  value = module.hotspot_firewall_zone.firewall_zones["data"][0]
}

output "guest_network" {
  description = <<DESCRIPTION
  ## Description

  Details about a the Guest network.

  ## Learn more

  https://developer.ui.com/network/v10.1.68/getnetworkdetails

  ## Example

  ```hcl
  {
    "cellularBackupEnabled" = false
    "default" = false
    "enabled" = true
    "id" = "2f6579e9-bf02-4c73-9308-0253d67a85d3"
    "internetAccessEnabled" = true
    "ipv4Configuration" = {
      "autoScaleEnabled" = true
      "dhcpConfiguration" = {
        "domainName" = ""
        "ipAddressRange" = {
          "start" = "192.168.10.2"
          "stop" = "192.168.10.254"
        }
        "leaseTimeSeconds" = 86400
        "mode" = "SERVER"
        "pingConflictDetectionEnabled" = true
      }
      "hostIpAddress" = "192.168.10.1"
      "prefixLength" = 24
    }
    "isolationEnabled" = false
    "management" = "GATEWAY"
    "mdnsForwardingEnabled" = false
    "metadata" = {
      "origin" = "USER_DEFINED"
    }
    "name" = "Guest Network"
    "vlanId" = 123
    "zoneId" = "364c92e1-c819-4d07-a402-221903cb4a94"
  }
  ```

  DESCRIPTION

  value = module.guest_network.network_details
}

output "ap_device" {
  description = <<DESCRIPTION
  ## Description

  List of Access Point capable devices on a site managed by the Unifi Network Application.

  Filter used: features.contains("accessPoint")

  ## Learn more

  https://developer.ui.com/network/v10.1.68/getsiteoverviewpage

  ## Example

  ```hcl
   [
    {
      "features" = [
        "switching",
        "accessPoint",
      ]
      "firmwareUpdatable" = false
      "firmwareVersion" = "5.0.10"
      "id" = "71dd82cc-acb1-31d0-9831-0935baac15c2"
      "interfaces" = [
        "ports",
        "radios",
      ]
      "ipAddress" = "1.2.3.4" # WAN IPv4 address
      "macAddress" = "ac:8b:a9:ff:ff:ff"
      "model" = "UDR"
      "name" = "UDR"
      "state" = "ONLINE"
      "supported" = true
    },
  ]
  ```

  DESCRIPTION

  value = module.wifi_capable_devices.adopted_devices["data"]
}

output "wifi_broadcast" {
  description = <<DESCRIPTION
  ## Description

  Map of WiFi Broadcast details.

  ## Learn more

  https://developer.ui.com/network/v10.1.84/getwifibroadcastdetails

  ## Example

  ```hcl
  {
    "wifi_guest" = {
      "advertiseDeviceName" = false
      "arpProxyEnabled" = false
      "bandSteeringEnabled" = true
      "broadcastingFrequenciesGHz" = [
        2.4,
        5,
      ]
      "bssTransitionEnabled" = true
      "clientIsolationEnabled" = false
      "enabled" = false
      "hideName" = false
      "id" = "ae19ae15-e8c3-4885-b17d-fd1192e1dc5d"
      "metadata" = {
        "origin" = "USER_DEFINED"
      }
      "multicastToUnicastConversionEnabled" = true
      "name" = "Guest Wifi"
      "network" = {
        "networkId" = "bc070d54-165d-42a1-bbee-a8e0b7275147"
        "type" = "SPECIFIC"
      }
      "securityConfiguration" = {
        "type" = "OPEN"
      }
      "type" = "STANDARD"
      "uapsdEnabled" = false
    }
    "wifi_orion_passpoint.yaml" = {
      "advertiseDeviceName" = false
      "arpProxyEnabled" = false
      "bandSteeringEnabled" = true
      "broadcastingFrequenciesGHz" = [
        2.4,
        5,
      ]
      "bssTransitionEnabled" = true
      "clientIsolationEnabled" = false
      "enabled" = false
      "hideName" = false
      "id" = "49703a8a-88c2-4e2c-9dd5-dbd4b29cf3bb"
      "metadata" = {
        "origin" = "USER_DEFINED"
      }
      "mloEnabled" = false
      "multicastToUnicastConversionEnabled" = true
      "name" = "Orion"
      "network" = {
        "type" = "NATIVE"
      }
      "securityConfiguration" = {
        "fastRoamingEnabled" = true
        "groupRekeyIntervalSeconds" = 3600
        "passphrase" = "Capricorn6-Broiling2-Kitchen4-Rockstar0-Module5"
        "saeConfiguration" = {
          "anticloggingThresholdSeconds" = 5
          "syncTimeSeconds" = 5
        }
        "type" = "WPA3_PERSONAL"
      }
      "type" = "STANDARD"
      "uapsdEnabled" = false
    }
    "wifi_single_ap.yaml" = {
      "advertiseDeviceName" = false
      "arpProxyEnabled" = true
      "bandSteeringEnabled" = true
      "broadcastingFrequenciesGHz" = [
        2.4,
        5,
      ]
      "bssTransitionEnabled" = true
      "clientIsolationEnabled" = false
      "enabled" = false
      "hideName" = false
      "id" = "142a1e4f-e362-4e51-9655-59a1befd3056"
      "metadata" = {
        "origin" = "USER_DEFINED"
      }
      "multicastFilteringPolicy" = {
        "action" = "ALLOW"
        "sourceMacAddressFilter" = [
          "14:c1:4e:ff:ff:ff",
          "d8:eb:46:ff:ff:ff",
          "ac:67:84:ff:ff:ff",
        ]
      }
      "multicastToUnicastConversionEnabled" = true
      "name" = "Test single AP SSID"
      "network" = {
        "type" = "NATIVE"
      }
      "securityConfiguration" = {
        "type" = "OPEN"
      }
      "type" = "STANDARD"
      "uapsdEnabled" = false
    }
  }
  ```

  DESCRIPTION

  value = {
    for name, details in module.wifi_broadcast :
    name => details.wifi_broadcast_details
  }
}
