module "sites" {
  source = "../../modules/sites"
}

module "adopted_devices" {
  source = "../../modules/adopted_devices"

  # Select the first site for this Unifi Network Application (Often the "Default" site)
  site_id = module.sites.sites["data"][0]["id"]
}

module "adopted_device_statistics" {
  source = "../../modules/adopted_device_statistics"

  # Get statistics for a specific adopted device by its ID
  site_id = module.sites.sites["data"][0]["id"]

  # Get statistics for a single device
  device_id = module.adopted_devices.adopted_devices["data"][0]["id"]
}
