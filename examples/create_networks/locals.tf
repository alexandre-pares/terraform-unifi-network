locals {
  base_url = {
    # Remote use Unifi API as a proxy
    # This is the prefered method if you don't have a direct connection to your Unifi Console
    remote = "https://api.ui.com/v1/connector/consoles/${var.console_id}/proxy/network/integration"

    # Local use a direct connection to your Unifi Console
    # This is the prefered method if you have a direct connection to your Unifi Console
    local = "https://${var.console_ip}/proxy/network/integration"
  }

  # Load Network configs from files
  # network_data_dir is the directory containing the YAML files for the network.
  network_data_dir = "${path.root}/networks"

  # network_files is the list of network YAML files to be processed
  network_files = fileset(local.network_data_dir, "network_*.yaml")

  # network_data_map is the decoded YAML data stored in a map
  network_data_map = {
    for f in local.network_files :
    f => yamldecode(file("${local.network_data_dir}/${f}"))
  }

  networks = {
    # Network can also be created using hcl
    # Gateway 4
    gateway_test_4 = {
      name            = "Test Gateway Network (04)"
      management_type = "GATEWAY"
      vlan_id         = 10

      enable_cellular_backup = false
      enable_mdns_forwarding = true
      enable_isolation       = true
      enable_internet_access = true

      ipv4_configuration = {
        enable_auto_scale = true
        host_ip_address   = "192.168.10.1"
        prefix_length     = 24

        dhcp_configuration = {
          mode = "SERVER"

          ip_address_range = {
            start = "192.168.10.1"
            stop  = "192.168.10.254"
          }

          lease_time_seconds = 1800 # 30 minutes

          domain_name = "pxe.onpremise.example.com"

          enable_ping_conflict_detection = true

          ntp_server_ip_addresses = [
            # Smear NTP servers
            # Don't mix smeared NTP with non-smearing
            "216.239.35.0", # Google (time1.google.com) https://www.ntppool.org/scores/216.239.35.0
            "216.239.35.4", # Google (time2.google.com) https://www.ntppool.org/scores/216.239.35.4
          ]

          pxe_configuration = {
            server_ip_address = "192.168.7.1"
            filename          = "iventoy_loader_16000_uefi" # Nice soft for PXE server
          }

          tftp_server_address = "192.168.7.1"

          time_offset_seconds = -28800 # UTC+1 Los Angeles (Pacific Time)
        }
      }

      firewall_zone_id = "854c48aa-687c-4520-b0c6-2d4dd324a0ec"
    }

    # Gateway 5
    gateway_test_5 = {
      name            = "Test Gateway Network (05)"
      management_type = "GATEWAY"
      vlan_id         = 11

      enable_cellular_backup = false
      enable_mdns_forwarding = true
      enable_isolation       = true
      enable_internet_access = true

      ipv4_configuration = {
        enable_auto_scale = true
        host_ip_address   = "192.168.11.1"
        prefix_length     = 24

        dhcp_configuration = {
          mode                     = "RELAY"
          dhcp_server_ip_addresses = ["192.168.9.1"]
        }
      }

      dhcp_guarding = {
        trusted_dhcp_server_ip_addresses = ["192.168.9.1"]
      }

      ipv6_configuration = {
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

      firewall_zone_id = "854c48aa-687c-4520-b0c6-2d4dd324a0ec"
    }
  }
}
