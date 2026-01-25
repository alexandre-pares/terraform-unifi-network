module "sites" {
  source = "../../modules/sites"
}

module "adopted_devices" {
  source = "../../modules/adopted_devices"

  # Select the first site for this Unifi Network Application (Often the "Default" site)
  site_id = module.sites.sites["data"][0]["id"]
}

module "adopted_device_statistics_ephemeral" {
  source = "../../modules/adopted_device_statistics_ephemeral"

  site_id   = module.sites.sites["data"][0]["id"]
  device_id = module.adopted_devices.adopted_devices["data"][0]["id"]
}
