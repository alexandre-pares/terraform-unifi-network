output "network_details" {
  description = <<DESCRIPTION
  ## Description

  Details about a network.

  ## Learn more

  https://developer.ui.com/network/v10.1.68/getnetworkdetails

  ## Example

  ```hcl
  {
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
  ```

  DESCRIPTION

  value = module.network_details.network_details
}
