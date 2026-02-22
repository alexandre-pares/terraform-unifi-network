module "sites" {
  source = "../../modules/sites"
}

module "adopted_devices" {
  source = "../../modules/adopted_devices"

  # Select the first site for this Unifi Network Application (Often the "Default" site)
  site_id = module.sites.sites["data"][0]["id"]

  query_parameters = {
    limit  = 20
    offset = 0
    filter = "features.contains('accessPoint')"
  }
}
