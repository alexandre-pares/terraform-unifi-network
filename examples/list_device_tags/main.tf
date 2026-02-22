module "sites" {
  source = "../../modules/sites"
}

module "device_tags" {
  source = "../../modules/device_tags"

  # Select the first site for this Unifi Network Application (Often the "Default" site)
  site_id = module.sites.sites["data"][0]["id"]

  query_parameters = {
    limit  = 20
    offset = 0
    # filter = "metadata.origin.eq('SYSTEM_DEFINED')"
  }
}
