module "sites" {
  source = "../../modules/sites"
}

module "vpn_servers" {
  source = "../../modules/vpn_servers"

  # Select the first site for this Unifi Network Application (Often the "Default" site)
  site_id = module.sites.sites["data"][0]["id"]

  # Get only WIREGUARD VPN Servers
  query_parameters = {
    limit  = 20
    offset = 0
    filter = "type.eq('WIREGUARD')"
  }
}
