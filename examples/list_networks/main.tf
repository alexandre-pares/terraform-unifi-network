module "sites" {
  source = "../../modules/sites"
}

module "networks" {
  source = "../../modules/networks"

  # Select the first site for this Unifi Network Application (Often the "Default" site)
  site_id = module.sites.sites["data"][0]["id"]
}
