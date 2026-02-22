module "sites" {
  source = "../../modules/sites"
}

module "networks" {
  source = "../../modules/networks"

  # Select the first site for this Unifi Network Application (Often the "Default" site)
  site_id = module.sites.sites["data"][0]["id"]

  # Return only user-defined networks (limited to 100 networks)
  query_parameters = {
    filter = "metadata.origin.eq('USER_DEFINED')"
    offset = 0
    limit  = 100
  }
}
