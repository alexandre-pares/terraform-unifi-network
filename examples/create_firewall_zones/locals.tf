locals {
  base_url = {
    # Remote use Unifi API as a proxy
    # This is the prefered method if you don't have a direct connection to your Unifi Console
    remote = "https://api.ui.com/v1/connector/consoles/${var.console_id}/proxy/network/integration"

    # Local use a direct connection to your Unifi Console
    # This is the prefered method if you have a direct connection to your Unifi Console
    local = "https://${var.console_ip}/proxy/network/integration"
  }

  # Load Firewall Zones configs from files
  # data_dir is the directory containing the YAML files for the firewall zones.
  data_dir = "${path.root}/firewall_zones"

  # firewall_zones_files is the list of network YAML files to be processed
  firewall_zones_files = fileset(local.data_dir, "fwz_*.yaml")

  # network_data_map is the decoded YAML data stored in a map
  firewall_zones_data_map = {
    for f in local.firewall_zones_files :
    f => yamldecode(file("${local.data_dir}/${f}"))
  }

  firewall_zones = {
    vpn_custom = {
      name = "Vpn_custom"
    }
  }
}
