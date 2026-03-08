module "sites" {
  source = "../../modules/sites"
}

module "clients" {
  source = "../../modules/clients"

  # Select the first site for this Unifi Network Application (Often the "Default" site)
  site_id = local.site_id
}

module "wifi_broadcasts" {
  source = "../../modules/wifis"

  site_id = local.site_id
}

module "wifi_broadcast_details" {
  source = "../../modules/wifi_details"

  site_id = local.site_id
  wifi_id = module.wifi_broadcasts.wifi_broadcasts["data"][3]["id"]
}
