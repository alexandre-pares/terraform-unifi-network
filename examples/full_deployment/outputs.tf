output "application_info" {
  description = <<DESCRIPTION
  ## Description

  Unifi Application Information.

  ## Learn more

  https://developer.ui.com/network/v10.1.68/getinfo

  ## Example

  ```hcl
  {
    "applicationVersion" = "10.1.68"
  }
  ```

  DESCRIPTION

  value = module.unifi_config.application_info
}

output "networks" {
  description = <<DESCRIPTION
  ## Description

  Map of created network details.

  ## Learn more

  https://developer.ui.com/network/v10.1.68/getnetworkdetails

  ## Example

  ```hcl
  {
    network_001 = {
      cellularBackupEnabled = false
      default               = true
      enabled               = true
      id                    = "1a25e9d4-8864-49d5-abc4-fffc47905326"
      internetAccessEnabled = true
      ipv4Configuration     = {
        autoScaleEnabled  = true
        dhcpConfiguration = {
            domainName                   = "local-domain.tld"
            ipAddressRange               = {
                start = "192.168.1.6"
                stop  = "192.168.1.254"
              }
            leaseTimeSeconds             = 86400
            mode                         = "SERVER"
            pingConflictDetectionEnabled = true
          }
        hostIpAddress     = "192.168.1.1"
        prefixLength      = 24
      }
    ipv6Configuration     = {
      clientAddressAssignment        = {
        slaacEnabled = true
      }
      interfaceType                  = "PREFIX_DELEGATION"
      prefixDelegationWanInterfaceId = "d7a6a629-5696-4140-ae5f-50a29bc04061"
      routerAdvertisement            = {
        priority = "HIGH"
      }
      }
      isolationEnabled      = false
      management            = "GATEWAY"
      mdnsForwardingEnabled = true
      metadata              = {
        configurable = true
        origin       = "SYSTEM_DEFINED"
      }
      name                  = "Default"
      vlanId                = 1
      zoneId                = "b54d3153-7f14-4aaf-9ceb-95a5a08d5519"
    }
  }
  ```

  DESCRIPTION

  value = module.unifi_config.networks
}

output "firewall_zones" {
  description = <<DESCRIPTION
  ## Description

  Map of Firewall Zone details.

  ## Learn more

  https://developer.ui.com/network/v10.1.84/getfirewallzonedetails

  ## Example

  ```hcl
  {
    fwz_hotspot_custom.yaml = {
      id = "857f712f-2f81-44a0-a16b-c4d00a9d8199"
      metadata = {
        origin = "USER_DEFINED"
      }
      name = "Hotspot_custom"
      networkIds = []
    }
    fwz_internal_custom.yaml = {
      id = "c0ee79a3-b05d-4133-8ad9-fa87b35c4eee"
      metadata = {
        origin = "USER_DEFINED"
      }
      name = "Internal_custom"
      networkIds = []
    }
    vpn_custom = {
      id = "bd172af0-0fdf-426c-a89c-42d438a572d4"
      metadata = {
        origin = "USER_DEFINED"
      }
      name = "Vpn_custom"
      networkIds = []
    }
  }
  ```

  DESCRIPTION

  value = module.unifi_config.firewall_zones
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

  value = module.unifi_config.wifi_broadcasts
}
