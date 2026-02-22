module "sites" {
  source = "../../modules/sites"
}

module "site_to_site_tunnels" {
  source = "../../modules/site_to_site_tunnels"

  # Select the first site for this Unifi Network Application (Often the "Default" site)
  site_id = module.sites.sites["data"][0]["id"]

  # Get only IPSEC tunnels with a name starting with "azure_"
  query_parameters = {
    limit  = 20
    offset = 0
    filter = "and(type.eq('IPSEC'),name.like('azure_*'))"
  }
}
