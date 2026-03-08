module "sites" {
  source = "../../modules/sites"
}

module "clients" {
  source = "../../modules/clients"

  # Select the first site for this Unifi Network Application (Often the "Default" site)
  site_id = module.sites.sites["data"][0]["id"]

  # Return only wired clients
  query_parameters = {
    filter = "type.eq('WIRED')"
    offset = 0
    limit  = 5
  }
}
