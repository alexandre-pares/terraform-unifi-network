module "sites" {
  source = "../../modules/sites"
}

module "radius_profiles" {
  source = "../../modules/radius_profiles"

  # Select the first site for this Unifi Network Application (Often the "Default" site)
  site_id = module.sites.sites["data"][0]["id"]

  query_parameters = {
    limit  = 20
    offset = 0
    filter = "metadata.origin.eq('SYSTEM_DEFINED')"
  }
}
