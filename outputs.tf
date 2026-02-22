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

  value = module.application_info.application_info
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

  value = module.network
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

  value = module.firewall_zone
}
