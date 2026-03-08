variable "site_id" {
  description = <<DESCRIPTION
  Unifi site Id.

  DESCRIPTION

  type     = string
  nullable = false
}

variable "networks" {
  description = <<DESCRIPTION
  (Optional) A map of networks to create

  - `management_type` - Type of management.
  - `name` - Name of the network.
  - `enabled` - (Optional) Whether the network is enabled.
  - `vlan_id` - VLAN ID of the network.
  - `enable_isolation` - (Optional) Whether this network is isolated from all other networks.
  - `enable_cellular_backup` - (Optional) Whether this network is allowed to use cellular data when WAN connection(s) are down.
  - `firewall_zone_id` - (Optional) Firewall zone ID associated with this Network.
  - `enable_internet_access` - (Optional) Whether the internet access is allowed for the device on this network.
  - `enable_mdns_forwarding` - (Optional) Whether this network should participate in mDNS traffic forwarding.

  ---
  `dhcp_guarding` supports the following:
  - `trusted_dhcp_server_ip_addresses` - (Optional) List of trusted DHCP server IP addresses.

  ---
  `ipv4_configuration` - IPv4 Configuration - supports the following:
  - `enable_auto_scale` - Whether the Network can automatically scale its subnet size based on the number of active DHCP leases.
  - `host_ip_address` - Address of the host network
  - `prefix_length` - CIDR of the network
  - `additional_host_ip_subnets` - (Optional) Additional host IP subnets assigned to this VLAN.
  - `dhcp_configuration` - IPv4 DHCP configuration for this network - supports the following:
    - `mode` - SERVER or RELAY
    - `ip_address_range` - Start and end IP range - supports the following:
      - `start` - Start of IP range
      - `stop` - End of IP range
    - `override_gateway_ip_address` - (Optional) Gateway IP address provided to DHCP clients.
    - `override_dns_server_ip_addresses` - (Optional) List of DNS servers assigned to client devices by the DHCP server.
    - `lease_time_seconds` - (Optional) The lease time in seconds for addresses in this range.
    - `domain_name` - (Optional) Domain name that can be used to access network in the browser.
    - `enable_ping_conflict_detection` - (Optional) Verify an IP address is unused by sending a ping before leasing it.
    - `pxe_configuration` - Pre execution environment configuration for network boot - supports the following:
      - `server_ip_address` - IP Address of the PXE server
      - `filename` - Filename to fetch
    - `ntp_server_ip_addresses` - (Optional) Network Time Protocol (NTP) server IP addresses.
    - `option_43_value` - (Optional) Custom DHCP option (43)
    - `tftp_server_address` - (Optional) Trivial File Transfer Protocol (TFTP) server address
    - `time_offset_seconds` - (Optional) Time offset in seconds from UTC.
    - `wpad_url` - (Optional) Web Proxy Auto-Discovery (WPAD) URL.
    - `wins_server_ip_addresses` - (Optional) Windows Internet Name Service (WINS) server IP addresses.
    - `dhcp_server_ip_addresses` - (Optional) DHCP Server IP addresses
  - `nat_outbound_ip_address_configuration` - Array of object (WAN NAT Outbound Configuration) - supports the following:
    - `type` - AUTO or STATIC
    - `wan_interface_ip` - WAN Interface IP
    - `ip_address_selection_mode` - (Optional) IP address selection mode which determines how the IP address will be selected from the group of IP addresses to translate the traffic on network using NAT.
    - `ip_address_selectors` - List of IP addresses or address ranges which determines which IP addresses - supports the following:
      - `type` - IP_ADDRESS or IP_ADDRESS_RANGE
      - `value` - (Optional)
      - `start` - (Optional)
      - `stop` - (Optional)

  ---
  `ipv6_configuration` - IPv6 Configuration - supports the following:
  - `interface_type` - IPv6 type to use
  - `client_address_assignment` - Client Address Assignment - supports the following:
    - `dhcp_configuration` - (Optional) DHCP Configuration - supports the following:
      - `ip_address_suffix_range` supports the following:
        - `start` - Start suffix of the DHCPv6 address pool.
        - `stop` - End suffix of the DHCPv6 address pool.
      - `lease_time_seconds` - The lease time in seconds for IP addresses in this range.
    - `enable_slaac` - Allows devices to obtain IPv6 addresses via SLAAC (Stateless Address Autoconfiguration) without DHCPv6.
  - `router_advertisement` - (Optional) Router advertisement (RA) supports the following:
    - `priority` - Router advertisement priority.
  - `override_dns_server_ip_addresses` - (Optional) The IPv6 DNS server addresses assigned to this Network.
  - `additional_host_ip_subnets` - (Optional) Additional host IP subnets assigned to this VLAN.
  - `host_ip_address` - (Optional) The static IPv6 address assigned to this Network.
  - `prefix_length` - (Optional) CIDR
  - `prefix_delegation_wan_interface_id` - (Optional) ID of the WAN interface from which the prefix is delegated.

  DESCRIPTION

  type = map(object({
    management_type = string
    name            = string
    enabled         = optional(bool)
    vlan_id         = number
    dhcp_guarding = optional(object({
      trusted_dhcp_server_ip_addresses = optional(list(string))
    }))
    enable_isolation       = optional(bool)
    enable_cellular_backup = optional(bool)
    firewall_zone_id       = optional(string)
    enable_internet_access = optional(bool)
    enable_mdns_forwarding = optional(bool)
    ipv4_configuration = optional(object({
      # Whether the Network can automatically scale its subnet size based on the number of active DHCP leases.
      enable_auto_scale = bool

      # Address of the host network
      host_ip_address = string

      # CIDR of the network
      prefix_length = number

      # Additional host IP subnets assigned to this VLAN.
      additional_host_ip_subnets = optional(list(string))

      # IPv4 DHCP configuration for this network.
      # If this field is omitted or null, DHCP is not working and hosts must get an address statically
      # or from another server in this broadcast domain.
      dhcp_configuration = optional(object({
        # SERVER or RELAY
        mode = string

        # Start and end IP range
        # If null, the first and last IP addresses available in the IP range will be used
        ip_address_range = optional(object({
          start = string
          stop  = string
        }))

        # Gateway IP address provided to DHCP clients.
        # If null, the default gateway will be assigned.
        override_gateway_ip_address = optional(string)

        # List of DNS servers assigned to client devices by the DHCP server.
        # If none are specified, they will be selected automatically.
        override_dns_server_ip_addresses = optional(list(string))

        # The lease time in seconds for addresses in this range.
        lease_time_seconds = optional(number)

        # Domain name that can be used to access network in the browser.
        domain_name = optional(string)

        # Verify an IP address is unused by sending a ping before leasing it.
        enable_ping_conflict_detection = optional(bool)

        # Pre execution environment configuration for network boot
        pxe_configuration = optional(object({
          # IP Address of the PXE server
          server_ip_address = string

          # Filename to fetch
          # Example: boot\x64\wdsnbp.com
          filename = string
        }))

        # Network Time Protocol (NTP) server IP addresses.
        # Max 2 servers
        # doesn't support domain, must be an IP
        ntp_server_ip_addresses = optional(list(string))

        # Custom DHCP option (43)
        # the value MUST be the UniFi Network application's host IP address.
        option_43_value = optional(string)

        # Trivial File Transfer Protocol (TFTP) server address
        # accepts a hostname, URL or IP address.
        tftp_server_address = optional(string)

        # Time offset in seconds from UTC.
        time_offset_seconds = optional(number)

        # Web Proxy Auto-Discovery (WPAD) URL.
        wpad_url = optional(string)

        # Windows Internet Name Service (WINS) server IP addresses.
        wins_server_ip_addresses = optional(list(string))

        # DHCP Server IP addresses
        # Required if mode is RELAY, not required if mode is SERVER
        dhcp_server_ip_addresses = optional(list(string))
      }))

      # Array of object (WAN NAT Outbound Configuration)
      nat_outbound_ip_address_configuration = optional(list(object({
        # AUTO or STATIC
        type = string

        # WAN interface IP
        wan_interface_ip = string

        # IP address selection mode which determines how the IP address will be selected
        # from the group of IP addresses to translate the traffic on network using NAT.
        # Required if type is AUTO
        ip_address_selection_mode = optional(string)

        # List of IP addresses or address ranges which determines which IP addresses
        # will be used to translate the traffic on network using NAT.
        ip_address_selectors = optional(set(object({
          # IP_ADDRESS or IP_ADDRESS_RANGE
          type  = string
          value = optional(string)
          start = optional(string)
          stop  = optional(string)
        })))

      })))

    }))
    ipv6_configuration = optional(object({
      # IPv6 type to use
      # - PREFIX_DELEGATION
      # - STATIC
      interface_type = string

      # Client Address Assignment
      client_address_assignment = object({
        # DHCP Configuration
        dhcp_configuration = optional(object({
          ip_address_suffix_range = object({
            # Start suffix of the DHCPv6 address pool.
            start = string
            # End suffix of the DHCPv6 address pool.
            stop = string
          })
          # The lease time in seconds for IP addresses in this range.
          lease_time_seconds = number
        }))

        # SLAAC
        # Allows devices to obtain IPv6 addresses via SLAAC (Stateless Address Autoconfiguration) without DHCPv6.
        # At least one addressing method must be active: either enable SLAAC or provide DHCP configuration.
        enable_slaac = bool
      })

      # Router advertisement (RA).
      # Without it, hosts will not autoconfigure addresses and will lack a default route even with DHCPv6.
      router_advertisement = optional(object({
        # Router advertisement priority.
        # - LOW
        # - MEDIUM
        # - HIGH
        priority = string
      }))

      # The IPv6 DNS server addresses assigned to this Network.
      # If none are specified, they will be selected automatically.
      override_dns_server_ip_addresses = optional(list(string))

      # Additional host IP subnets assigned to this VLAN.
      additional_host_ip_subnets = optional(list(string))

      # The static IPv6 address assigned to this Network.
      host_ip_address = optional(string)

      # CIDR
      prefix_length = optional(number)

      # ID of the WAN interface from which the prefix is delegated.
      prefix_delegation_wan_interface_id = optional(string)
    }))
    device_id = optional(string)
  }))

  nullable = true
  default  = {}
}

variable "firewall_zones" {
  description = <<DESCRIPTION
  (Optional) A map of firewall zones to create

  - `name` - Name of the firewall zone
  - `network_ids` - (Optional) List of network id to attach to this firewall zone.

  DESCRIPTION

  type = map(object({
    name        = string
    network_ids = optional(list(string))
  }))

  nullable = true
  default  = {}
}

variable "wifi_broadcasts" {
  description = <<DESCRIPTION
  (Optional) A map of WiFi broadcasts to create

  - `type` - Type of WiFi broadcast. Possible values are `STANDARD` and `IOT_OPTIMIZED`.
  - `name` - Name of the WiFi broadcast.
  - `enabled` - Whether the WiFi broadcast is enabled or not.
  - `enable_multicast_to_unicast_conversion` - Converts multicast WiFi traffic to unicast, when possible.
  - `enable_client_isolation` - Enable client isolation.
  - `hide_wifi_name` - Hide WiFi Network name.
  - `enable_uapsd` - Enable Unscheduled Automatic Power Save Delivery (U-APSD).
  - `broadcasting_frequencies_ghz` - List of Broadcasting frequencies in Ghz. Possible values are defined by access point capabilities.
  - `enable_mlo` - Enable Multi-Link Operation (MLO).
  - `enable_band_steering` - Enable Band Sterring.
  - `enable_arp_proxy` - Enable ARP Proxy. Reduces airtime usage by allowing APs to 'proxy' common broadcast frames as unicast.
  - `enable_bss_transition` - Enable BSS Transition.
  - `advertise_device_name` - Indicates whether the device name is advertised in beacon frames.

  ---
  - `network` - Network to attached the WiFi broadcast to.
    - `type` - Type of the network. Possible values are `NATIVE` and `SPECIFIC`
    - `network_id` - Id of the network. Required if `type` is `SPECIFIC`

  ---
  - `security_configuration` - Security configuration of the WiFi broadcast.
    - `type` - Security type of the WiFi broadcast. Possible values are `OPEN`, `WPA2_PERSONAL`, `WPA3_PERSONAL`, `WPA2_WPA3_PERSONAL`, `WPA2_ENTERPRISE`, `WPA3_ENTERPRISE` and `WPA2_WPA3_ENTERPRISE`.
    - `group_rekey_interval_seconds` - Group rekey interval in seconds. Sets how often connected device groups are assigned a new key. If null, then it is disabled. This feature is not available for IoT configuration.
    - `enable_fast_roaming` - Fast roaming enabled flag. This feature is not available for IoT configuration or OPEN security. You will experience connectivity issues with devices that do not support the 802.11r WiFi standard.
    - `passphrase` - Passphrase. Required when type is `WPA2_PERSONAL`, `WPA3_PERSONAL` or `WPA2_WPA3_PERSONAL`
    - `pmf_mode` - Protected Management Frames mode. If null, then it is disabled. This feature is not available for IoT configuration.
    - `enable_wpa3_fast_roaming` - WPA3 fast roaming can be enabled only if the default fast roaming is enabled.
    - `enable_coa` - Indicates whether Change of Authorization (COA) is enabled.
    - `security_mode` - Security mode. Possible values are `PERSONAL`
    - `radius_configuration` - Radius configuration
      - `profile_id` - Radius profile Id. You can use the `radius_profiles` sub-module to get the radius profile id.
      - `nas_id` - WiFi Radius NAS Id.
        - `type` - Type of the NAS Id. Possible values are `DERIVED` and `USER_DEFINED`.
        - `source` - Source of the NAS Id. Required if the NAS Id type is `DERIVED`.
        - `value` - Value of the NAS Id. Required if the NAS Id type is `USER_DEFINED`.
      - `mac_authentication_configuration` - MAC Authentication configuration.
        - `mac_address_format` - MAC address format.
    - `sae_configuration` - Configuration for SAE (Simultaneous Authentication of Equals).
      - `anticlogging_threshold_seconds` - SAE Anti-clogging
      - `sync_time_seconds` - SAE Sync Time
    - `pre_shared_keys` - List of pre-shared keys. Required when type is `WPA2_PERSONAL`, `WPA3_PERSONAL` or `WPA2_WPA3_PERSONAL`. This is an alternative to using the `passphrase` variable and allows you to set different passphrases for different VLANs.
      - `network` - Network configuration for the pre-shared key.
        - `type` - Type of the network. Possible values are `NATIVE` and `SPECIFIC`. If `SPECIFIC` is used, the `network_id` key must be set.
        - `network_id` - Network Id. Required if the network type is `SPECIFIC`.
      - `passphrase` - Passphrase for the pre-shared key.
    - `sae_configuration` - Configuration for SAE (Simultaneous Authentication of Equals).
      - `anticlogging_threshold_seconds`
      - `sync_time_seconds`

  ---
  - `broadcasting_device_filter` - Defines the custom scope of devices that will broadcast this WiFi network.
    - `type` - Type of the filter. Possible values are `DEVICES` and `DEVICE_TAGS`.
    - `device_ids` - List of Access Point capable device IDs to which the WiFi broadcast applies. Required if the filter type is `DEVICES`. You can use the `devices` sub-module to get the device ids.
    - `device_tags_ids` - List device tag IDs to which the WiFi broadcast applies. Required if the filter type is `DEVICE_TAGS`. You can use the `device_tags` sub-module to get the device tag ids.

  ---
  - `mdns_proxy_configuration` - mDNS filtering configuration.
    - `mode` - mDNS proxy mode. Possible values are `AUTO` and `CUSTOM`.
    - `policies` - Array of mDNS proxy policies. Required if the mode is `CUSTOM`.
      - `action` - Action to apply for matching mDNS traffic. Possible values are `ALLOW`and `BLOCK`
      - `device_filter` - Defines the custom scope of devices that will filter Mdns. If null, the mDNS filtering will be added to all Access Point capable devices.
      - `service_filter` - Array of object (mDNS service)
        - `type` - `PREDEFINED` or `CUSTOM`
        - `name` - Name of the service.
        - `type_domain` - Type domain of the service. Required if the service type is `CUSTOM`.
      - `bridging_network_ids` - Array of network ids.

  ---
  - `multicast_filtering_policy` - Multicast filtering policy.
    - `action` - Action to apply for matching multicast traffic. Possible values are `ALLOW`and `BLOCK`
    - `source_mac_address_filter` - List of multicast source MAC addresses allowed. Multicast traffic from gateways is always allowed. Required if action is ALLOW.

  ---
  - `basic_data_rate_kbps_by_frequency_ghz` - Basic data rates in Kbps by frequency in Ghz.
    - `2.4` - List of data rates for the 2.4 Ghz band
    - `5` - List of data rates for the 5 Ghz band

  ---
  - `client_filtering_policy` - Client connection filtering policy.
    - `action` - Action to apply. Possible values are `BLOCK` and `ALLOW`.
    - `mac_address_filter` - List of client MAC addresses.

  ---
  - `blackout_schedule_configuration` - Time when this WiFi is disabled.
    - `days` - List of days when the WiFi is disabled
      - `type` - Type of blackout. Possible values are `ALL_DAY` and `TIME_RANGE`.
      - `day` - Day of the week when the WiFi is disabled. Required when `type` is `ALL_DAY``
      - `time_ranges` - List of time ranges
        - `start_time` - Start time in 24-hour format (HH:mm)
        - `end_time` - End time in 24-hour format (HH:mm)

  ---
  - `hotspot_configuration` - WiFi Hotspot configuration.
    - `type` - Type of WiFi hotspot. Possible values are `CAPTIVE_PORTAL` and `PASSPOINT`.

  ---
  - `dtim_period_by_frequency_ghz_override` - DTIM (Delivery Traffic Indication Message) period override by frequency in Ghz.
    - `2.4` - DTIM period override for the 2.4 Ghz band
    - `5` - DTIM period override for the 5 Ghz band
    - `6` - DTIM period override for the 6 Ghz band (if supported by the access points)

  DESCRIPTION

  type = map(object({
    type = optional(string)
    name = string
    network = optional(object({
      type       = string
      network_id = optional(string)
    }))
    enabled = optional(bool)
    security_configuration = optional(object({
      type = string
      radius_configuration = optional(object({
        profile_id = string
        nas_id = object({
          # DERIVED or USER_DEFINED
          type   = string
          source = optional(string)
          value  = optional(string)
        })
        mac_authentication_configuration = optional(object({
          mac_address_format = string
        }))
      }))
      # Group rekey interval in seconds. Sets how often connected device groups are assigned a new key.
      # If null, then it is disabled. This feature is not available for IoT configuration.
      group_rekey_interval_seconds = optional(number)

      # Fast roaming enabled flag. This feature is not available for IoT configuration.
      enable_fast_roaming = optional(bool)

      # Passphrase to connect to the WiFi.
      passphrase = optional(string)

      # Pre-shared keys.
      pre_shared_keys = optional(list(object({
        network = object({
          type       = string
          network_id = optional(string)
        })
        passphrase = string
      })))

      # Protected Management Frames mode.
      # If null, then it is disabled. This feature is not available for IoT configuration.
      pmf_mode = optional(string)

      # WPA3 fast roaming can be enabled only if the default fast roaming is enabled
      enable_wpa3_fast_roaming = optional(bool)

      # Configuration for SAE (Simultaneous Authentication of Equals).
      sae_configuration = optional(object({
        anticlogging_threshold_seconds = number
        sync_time_seconds              = number
      }))

      # Enable COA
      # Indicates whether Change of Authorization (COA) is enabled
      enable_coa = optional(bool)

      # Security Mode
      security_mode = optional(string)
    }))
    broadcasting_device_filter = optional(object({
      type           = string
      device_ids     = optional(list(string))
      device_tag_ids = optional(list(string))
    }))
    mdns_proxy_configuration = optional(object({
      mode = string
      policies = optional(list(object({
        action = string
        device_filter = optional(object({
          action = string
          device_filter = optional(object({
            type           = string
            device_ids     = optional(list(string))
            device_tag_ids = optional(list(string))
          }))
          service_filter = optional(list(object({
            type        = string
            name        = optional(string)
            type_domain = optional(string)
          })))
          bridging_network_ids = optional(list(string))
        }))
      })))
    }))
    multicast_filtering_policy = optional(object({
      action                    = string
      source_mac_address_filter = optional(list(string))
    }))
    enable_multicast_to_unicast_conversion = optional(bool)
    enable_client_isolation                = optional(bool)
    hide_wifi_name                         = optional(bool)
    enable_uapsd                           = optional(bool)
    basic_data_rate_kbps_by_frequency_ghz  = optional(map(list(number)))
    client_filtering_policy = optional(object({
      action             = string
      mac_address_filter = list(string)
    }))
    blackout_schedule_configuration = optional(object({
      days = list(object({
        # ALL_DAY or TIME_RANGE
        type = string
        day  = string
        time_ranges = optional(list(object({
          # Start time in 24-hour format (HH:mm)
          start_time = string
          # End time in 24-hour format (HH:mm)
          end_time = string
        })))
      }))
    }))
    broadcasting_frequencies_ghz = optional(list(number))
    hotspot_configuration = optional(object({
      # CAPTIVE_PORTAL or PASSPOINT
      type = string
    }))
    enable_mlo                            = optional(bool)
    enable_band_steering                  = optional(bool)
    enable_arp_proxy                      = optional(bool)
    enable_bss_transition                 = optional(bool)
    advertise_device_name                 = optional(bool)
    dtim_period_by_frequency_ghz_override = optional(map(number))
  }))
  nullable = true
  default  = {}
}
