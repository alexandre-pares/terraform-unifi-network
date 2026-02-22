module "sites" {
  source = "../../modules/sites"
}

module "adopted_devices" {
  source = "../../modules/adopted_devices"

  # Select the first site for this Unifi Network Application (Often the "Default" site)
  site_id = local.site_id
}

module "adopted_device_details" {
  source = "../../modules/adopted_device_details"

  # Get details for a specific adopted device by its ID
  site_id = local.site_id

  # Get details for a single device
  device_id = module.adopted_devices.adopted_devices["data"][0]["id"]
}
