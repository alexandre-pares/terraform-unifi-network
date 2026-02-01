variable "site_id" {
  description = <<DESCRIPTION
  ## Description

  Unifi site Id.

  ## Example

  `4c2d331d-6cdc-39d5-ae48-7457ff007b02`

  ## How to get the site Id

  You can use the `sites` sub-module to get the site id.

  DESCRIPTION

  type     = string
  nullable = false
}

variable "management_type" {
  description = <<DESCRIPTION
  ## Description



  ## Default

  `GATEWAY`

  ## Possible values

  - `GATEWAY`
  - `UNMANAGED`
  - `SWITCH`

  DESCRIPTION

  type     = string
  nullable = false
  default  = "GATEWAY"


  validation {
    condition     = contains(["GATEWAY", "UNMANAGED", "SWITCH"], var.management_type)
    error_message = "`management_type` must be one of 'GATEWAY', 'UNMANAGED', or 'SWITCH'."
  }
}

variable "name" {
  description = <<DESCRIPTION
  ## Description

  Name of the network.

  ## Example

  `Test Network`

  DESCRIPTION

  type     = string
  nullable = false
}

variable "enabled" {
  description = <<DESCRIPTION
  ## Description

  Whether the network is enabled.

  ## Default

  `true`

  DESCRIPTION

  type     = bool
  nullable = false
  default  = true
}

variable "vlan_id" {
  description = <<DESCRIPTION
  ## Description

  VLAN ID of the network.

  ## Example

  `3`

  DESCRIPTION

  type     = number
  nullable = false

  validation {
    condition     = var.vlan_id >= 1 && var.vlan_id <= 4094
    error_message = "`vlan_id` MUST be between 1 and 4094."
  }
}

variable "dhcp_guarding" {
  description = <<DESCRIPTION
  ## Description

  DHCP Guarding settings for this Network.
  If this field is omitted or null, the feature is disabled.

  ## Format

  ```hcl
    # List of trusted DHCP server IP addresses.
  {
    trusted_dhcp_server_ip_addresses = list(string)
  }
  ```

  ## Examples

  ### Disable DHCP Guarding

  ```hcl
  dhcp_guarding = null
  ```

  ### Enabled DHCP Guarding

  ```hcl
  dhcp_guarding = {
    trusted_dhcp_server_ip_addresses = ["192.168.1.1"]
  }
  ```

  DESCRIPTION

  type = object({
    trusted_dhcp_server_ip_addresses = optional(list(string))
  })
  nullable = true
  default  = null
}

variable "enable_isolation" {
  description = <<DESCRIPTION
  ## Description

  Whether this network is isolated from all other networks.

  ## Example

  `true`

  ## Default

  null

  DESCRIPTION

  type     = bool
  nullable = true
  default  = null
}

variable "enable_cellular_backup" {
  description = <<DESCRIPTION
  ## Description

  Whether this network is allowed to use cellular data when WAN connection(s) are down.

  ## Example

  `true`

  ## Default

  null

  DESCRIPTION

  type     = bool
  nullable = true
  default  = null
}

variable "firewall_zone_id" {
  description = <<DESCRIPTION
  ## Description

  Firewall zone ID associated with this Network.

  ## Example

  `c149df49-8155-4dd2-a7c6-c69609d508f0`

  DESCRIPTION

  type     = string
  nullable = true
  default  = null
}

variable "enable_internet_access" {
  description = <<DESCRIPTION
  ## Description

  Whether the internet access is allowed for the device on this network.

  ## Example

  `true`

  DESCRIPTION

  type     = bool
  nullable = true
  default  = null
}

variable "enable_mdns_forwarding" {
  description = <<DESCRIPTION
  ## Description

  Whether this network should participate in mDNS traffic forwarding.

  ## Example

  `true`

  DESCRIPTION

  type     = bool
  nullable = true
  default  = null
}

variable "ipv4_configuration" {
  description = <<DESCRIPTION
  ## Description

  IPv4 Configuration

  ## Example

  ```hcl

  ```

  DESCRIPTION

  type = object({
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

  })

  nullable = true
  default  = null
}



# IPv6 Configuration
# Todo
variable "ipv6_configuration" {
  description = <<DESCRIPTION
  ## Description

  IPv6 Configuration

  ## Example

  ### Static with SLAAC

  ```hcl
  {
    interface_type = "STATIC"

    host_ip_address = "fd11:2233:4455::"

    prefix_length = 64

    client_address_assignment = {
      enable_slaac = true
    }

    router_advertisement = {
      priority = "HIGH"
    }
  }
  ```

  ### Static with DHCPv6

  DESCRIPTION

  type = object({
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
  })

  nullable = true
  default  = null
}

variable "device_id" {
  description = <<DESCRIPTION
  ## Description

  ID of the L3 switching capable device that manages this network.

  ## Examples

  `3311ddbc-5e5a-45c7-8e5a-699c378e14a4`

  DESCRIPTION

  type     = string
  nullable = true
  default  = null
}
