module "sites" {
  source = "../../modules/sites"
}

module "firewall_zone" {
  source = "../../modules/firewall_zone"

  for_each = merge(local.firewall_zones, local.firewall_zones_data_map)

  site_id = module.sites.sites["data"][0]["id"]
  name    = each.value.name
}
