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
