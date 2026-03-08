locals {
  network_properties = merge(
    {
      management = var.management_type
      name       = var.name
      enabled    = var.enabled
      vlanId     = var.vlan_id
    },
    # DHCP Guard
    (var.dhcp_guarding != null) ? {
      dhcpGuarding = {
        trustedDhcpServerIpAddresses = var.dhcp_guarding.trusted_dhcp_server_ip_addresses
      }
    } : {},

    # Check if auto scale is enabled
    (var.enable_isolation != null) ? {
      isolationEnabled = var.enable_isolation
    } : {},

    # Check if it has cellular backup
    (var.enable_cellular_backup != null) ? {
      cellularBackupEnabled = var.enable_cellular_backup
    } : {},

    # Check if it is linked to a L3 switch
    (var.device_id != null) ? {
      deviceId = var.device_id
    } : {},

    # Check if it participate to mDNS traffic forwarding.
    (var.enable_mdns_forwarding != null) ? {
      mdnsForwardingEnabled = var.enable_mdns_forwarding
    } : {},

    # Firewall zone id
    (var.firewall_zone_id != null) ? {
      zoneId = var.firewall_zone_id
    } : {},

    # Can access internet?
    (var.enable_internet_access != null) ? {
      internetAccessEnabled = var.enable_internet_access
    } : {},

    # IPv4 configuration
    (var.ipv4_configuration != null) ? {
      ipv4Configuration = merge({
        autoScaleEnabled = var.ipv4_configuration.enable_auto_scale
        hostIpAddress    = var.ipv4_configuration.host_ip_address
        prefixLength     = var.ipv4_configuration.prefix_length
        },

        # Additional IP subnets
        (var.ipv4_configuration.additional_host_ip_subnets != null) ? {
          additionalHostIpSubnets = var.ipv4_configuration.additional_host_ip_subnets
        } : {},

        # DHCP Config
        (var.ipv4_configuration.dhcp_configuration != null) ? {
          dhcpConfiguration = merge({
            mode = var.ipv4_configuration.dhcp_configuration.mode
            },

            # IP Address Range (Start and Stop)
            (var.ipv4_configuration.dhcp_configuration.ip_address_range != null) ? {
              ipAddressRange = var.ipv4_configuration.dhcp_configuration.ip_address_range
            } : {},

            # Gateway IP override
            (var.ipv4_configuration.dhcp_configuration.override_gateway_ip_address != null) ? {
              gatewayIpAddressOverride = var.ipv4_configuration.dhcp_configuration.override_gateway_ip_address
            } : {},

            # DNS override
            (var.ipv4_configuration.dhcp_configuration.override_dns_server_ip_addresses != null) ? {
              dnsServerIpAddressesOverride = var.ipv4_configuration.dhcp_configuration.override_dns_server_ip_addresses
            } : {},

            # Lease time
            (var.ipv4_configuration.dhcp_configuration.lease_time_seconds != null) ? {
              leaseTimeSeconds = var.ipv4_configuration.dhcp_configuration.lease_time_seconds
            } : {},

            # Domain name
            (var.ipv4_configuration.dhcp_configuration.domain_name != null) ? {
              domainName = var.ipv4_configuration.dhcp_configuration.domain_name
            } : {},

            # Ping conflict before a lease
            (var.ipv4_configuration.dhcp_configuration.enable_ping_conflict_detection != null) ? {
              pingConflictDetectionEnabled = var.ipv4_configuration.dhcp_configuration.enable_ping_conflict_detection
            } : {},

            # PXE config
            (var.ipv4_configuration.dhcp_configuration.pxe_configuration != null) ? {
              pxeConfiguration = {
                serverIpAddress = var.ipv4_configuration.dhcp_configuration.pxe_configuration.server_ip_address
                filename        = var.ipv4_configuration.dhcp_configuration.pxe_configuration.filename
              }
            } : {},

            # NTP servers
            (var.ipv4_configuration.dhcp_configuration.ntp_server_ip_addresses != null) ? {
              ntpServerIpAddresses = var.ipv4_configuration.dhcp_configuration.ntp_server_ip_addresses
            } : {},

            # DHCP Option 43
            (var.ipv4_configuration.dhcp_configuration.option_43_value != null) ? {
              option43Value = var.ipv4_configuration.dhcp_configuration.option_43_value
            } : {},

            # TFTP server
            (var.ipv4_configuration.dhcp_configuration.tftp_server_address != null) ? {
              tftpServerAddress = var.ipv4_configuration.dhcp_configuration.tftp_server_address
            } : {},

            # Time offset
            (var.ipv4_configuration.dhcp_configuration.time_offset_seconds != null) ? {
              timeOffsetSeconds = var.ipv4_configuration.dhcp_configuration.time_offset_seconds
            } : {},

            # WPAD URL
            (var.ipv4_configuration.dhcp_configuration.wpad_url != null) ? {
              wpadUrl = var.ipv4_configuration.dhcp_configuration.wpad_url
            } : {},

            # WINS IP
            (var.ipv4_configuration.dhcp_configuration.wins_server_ip_addresses != null) ? {
              winsServerIpAddresses = var.ipv4_configuration.dhcp_configuration.wins_server_ip_addresses
            } : {},

            # DHCP server IP (when mode = RELAY)
            (var.ipv4_configuration.dhcp_configuration.dhcp_server_ip_addresses != null) ? {
              dhcpServerIpAddresses = var.ipv4_configuration.dhcp_configuration.dhcp_server_ip_addresses
            } : {}
          )
        } : {},

        # Additional IP subnets
        (var.ipv4_configuration.nat_outbound_ip_address_configuration != null) ? {
          natOutboundIpAddressConfiguration = merge({
            type           = var.ipv4_configuration.nat_outbound_ip_address_configuration.type
            wanInterfaceId = var.ipv4_configuration.nat_outbound_ip_address_configuration.wan_interface_ip
            },

            # IP address selection
            (var.ipv4_configuration.nat_outbound_ip_address_configuration.ip_address_selection_mode != null) ? {
              ipAddressSelectionMode = var.ipv4_configuration.nat_outbound_ip_address_configuration.ip_address_selection_mode
            } : {},

            # IP address selection mode
            (var.ipv4_configuration.nat_outbound_ip_address_configuration.ip_address_selectors != null) ? {
              ipAddressSelectionMode = var.ipv4_configuration.nat_outbound_ip_address_configuration.ip_address_selectors
            } : {},
          )
        } : {},
      )
    } : {},

    # IPv6 Configuration
    (var.ipv6_configuration != null) ? {
      ipv6Configuration = merge({
        # IPv6 type to use
        interfaceType = var.ipv6_configuration.interface_type

        # Client Address Assignment
        clientAddressAssignment = merge({
          # SLAAC
          slaacEnabled = var.ipv6_configuration.client_address_assignment.enable_slaac
          },

          # DHCP Configuration
          (var.ipv6_configuration.client_address_assignment.dhcp_configuration != null) ? {
            dhcpConfiguration = {
              ipAddressSuffixRange = var.ipv6_configuration.client_address_assignment.dhcp_configuration.ip_address_suffix_range
              leaseTimeSeconds     = var.ipv6_configuration.client_address_assignment.dhcp_configuration.lease_time_seconds
            }
          } : {}
        )
        },

        # Router Advertisement (RA)
        (var.ipv6_configuration.router_advertisement != null) ? {
          routerAdvertisement = var.ipv6_configuration.router_advertisement
        } : {},

        # IPv6 DNS servers
        (var.ipv6_configuration.override_dns_server_ip_addresses != null) ? {
          dnsServerIpAddressesOverride = var.ipv6_configuration.override_dns_server_ip_addresses
        } : {},

        # Additional host IP subnets
        (var.ipv6_configuration.additional_host_ip_subnets != null) ? {
          additionalHostIpSubnets = var.ipv6_configuration.additional_host_ip_subnets
        } : {},

        # Static IPv6 address
        (var.ipv6_configuration.host_ip_address != null) ? {
          hostIpAddress = var.ipv6_configuration.host_ip_address
        } : {},

        # CIDR
        (var.ipv6_configuration.prefix_length != null) ? {
          prefixLength = var.ipv6_configuration.prefix_length
        } : {},

        # WAN Interface ID
        (var.ipv6_configuration.prefix_delegation_wan_interface_id != null) ? {
          prefixDelegationWanInterfaceId = var.ipv6_configuration.prefix_delegation_wan_interface_id
        } : {}
      )
    } : {}
  )
}
