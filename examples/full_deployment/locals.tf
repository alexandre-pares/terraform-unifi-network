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

  # Map Network to default Firewall Zone
  network_to_firewall_zone = {
    "Guest Network"      = "Hotspot"
    "Management Network" = "Internal"
    "Internal Network"   = "Internal"
  }

  # Lead Firewall Zones configs from files
  # firewall_zones_data_dir is the directory containing the YAML files for the firewall zones.
  firewall_zones_data_dir = "${path.root}/firewall_zones"

  # firewall_zones_files is the list of network YAML files to be processed
  firewall_zones_files = fileset(local.firewall_zones_data_dir, "fwz_*.yaml")

  # firewall_zones_data_map is the decoded YAML data stored in a map
  firewall_zones_data_map = {
    for f in local.firewall_zones_files :
    f => yamldecode(file("${local.firewall_zones_data_dir}/${f}"))
  }

  # Map of firewall zones by name
  firewall_zones_by_name = {
    for k, v in module.firewall_zones.firewall_zones["data"] : v.name => v
  }
}
