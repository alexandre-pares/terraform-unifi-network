module "sites" {
  source = "../../modules/sites"
}

module "firewall_zones" {
  source = "../../modules/firewall_zones"

  # Select the first site for this Unifi Network Application (Often the "Default" site)
  site_id = module.sites.sites["data"][0]["id"]
}


module "unifi_config" {
  source = "../.."

  site_id = module.sites.sites["data"][0]["id"]

  firewall_zones = local.firewall_zones_data_map

  networks = { for name, data in local.network_data_map : name => merge(data, {
    firewall_zone_id = local.firewall_zones_by_name[local.network_to_firewall_zone[data.name]].id
  }) }
}
