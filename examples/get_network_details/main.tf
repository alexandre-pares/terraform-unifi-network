module "sites" {
  source = "../../modules/sites"
}

module "networks" {
  source = "../../modules/networks"

  # Select the first site for this Unifi Network Application (Often the "Default" site)
  site_id = module.sites.sites["data"][0]["id"]
}

module "network_details" {
  source = "../../modules/network_details"

  # Get details about the first network in the selected site (often the "Default" network / SYSTEM_DEFINED)
  site_id    = module.sites.sites["data"][0]["id"]
  network_id = module.networks.networks["data"][0]["id"]
}
