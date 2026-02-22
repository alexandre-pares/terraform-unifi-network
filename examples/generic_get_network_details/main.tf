module "sites" {
  source = "../../modules/sites"
}

module "networks" {
  source = "../../modules/generic_get_client"

  # Get details about the first network in the selected site (often the "Default" network / SYSTEM_DEFINED)
  path = "/v1/sites/${local.site_id}/networks"

  query_parameters = {
    # "filter" = "metadata.origin.eq('USER_DEFINED')"
    "filter" = "metadata.origin.eq('SYSTEM_DEFINED')"
  }
}

module "network_details" {
  source = "../../modules/network_details"

  # Get details about the first network in the selected site (often the "Default" network / SYSTEM_DEFINED)
  site_id    = local.site_id
  network_id = module.networks.response["data"][0]["id"]
}

module "firewall_zone_details" {
  source = "../../modules/generic_get_client"

  path = "/v1/sites/${local.site_id}/firewall/zones/${module.network_details.network_details.zoneId}"
}
