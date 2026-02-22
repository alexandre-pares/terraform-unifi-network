module "sites" {
  source = "../../modules/sites"
}

module "wan_interfaces" {
  source = "../../modules/wan_interfaces"

  # Select the first site for this Unifi Network Application (Often the "Default" site)
  site_id = module.sites.sites["data"][0]["id"]

  query_parameters = {
    limit  = 1
    offset = 1
  }
}
