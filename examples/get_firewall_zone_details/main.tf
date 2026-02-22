module "sites" {
  source = "../../modules/sites"
}

# List Firewall Zones available
module "firewall_zones" {
  source  = "../../modules/firewall_zones"
  site_id = local.site_id

  query_parameters = {
    filter = "metadata.origin.eq('SYSTEM_DEFINED')"
  }
}

# Get Firewall Zone details
module "firewall_zone_details" {
  source = "../../modules/firewall_zone_details"

  site_id          = local.site_id
  firewall_zone_id = module.firewall_zones.firewall_zones.data[0].id
}
