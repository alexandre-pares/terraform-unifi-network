locals {
  base_url = {
    # Remote use Unifi API as a proxy
    # This is the prefered method if you don't have a direct connection to your Unifi Console
    remote = "https://api.ui.com/v1/connector/consoles/${var.console_id}/proxy/network/integration"

    # Local use a direct connection to your Unifi Console
    # This is the prefered method if you have a direct connection to your Unifi Console
    local = "https://${var.console_ip}/proxy/network/integration"
  }

  default_unifi_site_id = module.default_sites.sites["data"][0]["id"]

  # Load Wifi configs from files
  # wifi_data_dir is the directory containing the YAML files for the wifi.
  wifi_data_dir = "${path.root}/wifi_broadcasts"

  # wifi_files is the list of wifi YAML files to be processed
  wifi_files = fileset(local.wifi_data_dir, "wifi_*.yaml")

  # wifi_data_map is the decoded YAML data stored in a map
  wifi_data_map = {
    for f in local.wifi_files :
    f => yamldecode(file("${local.wifi_data_dir}/${f}"))
  }

  pre_shared_keys = [for row in csvdecode((file("${path.root}/wifi_ppsk/ppsk.csv"))) : {
    passphrase = row["Password"]
    network = {
      # The "good" way is to fetch the list of network and match from the vlan the network type and id.
      # For simplicity we use the native/default network.
      type = "NATIVE"
    }
    }
  ]

  wifi_broadcasts = {
    "wifi_guest" = {
      type    = "STANDARD"
      name    = "Guest Wifi"
      enabled = false
      network = {
        type       = "SPECIFIC"
        network_id = module.guest_network.network_details.id
      }
      security_configuration = {
        type = "OPEN"
      }
      broadcasting_frequencies_ghz = [
        2.4,
        5
      ]
      enable_bss_transition = false
      advertise_device_name = false
      enable_arp_proxy      = true
    }
    "wifi_ppsk_from_csv_file" = {
      type    = "STANDARD"
      name    = "WiFi with PPSK (from CSV file)"
      enabled = false
      security_configuration = {
        type                = "WPA2_PERSONAL"
        pre_shared_keys     = local.pre_shared_keys
        enable_fast_roaming = true
      }
      broadcasting_frequencies_ghz = [2.4]
      enable_bss_transition        = false
      advertise_device_name        = false
      enable_arp_proxy             = true
    }
  }
}
