module "sites" {
  source = "../../modules/sites"
}

module "clients" {
  source = "../../modules/clients"

  # Select the first site for this Unifi Network Application (Often the "Default" site)
  site_id = local.site_id
}

module "connected_client_details" {
  source = "../../modules/client_details"

  site_id = local.site_id

  # Get details for a single client
  client_id = module.clients.clients["data"][0]["id"]
}
