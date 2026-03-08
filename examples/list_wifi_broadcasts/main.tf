module "sites" {
  source = "../../modules/sites"
}

module "wifi_broadcasts" {
  source = "../../modules/wifis"

  # Select the first site for this Unifi Network Application (Often the "Default" site)
  site_id = module.sites.sites["data"][0]["id"]

  # Return only Wifi on the 5Ghz or 6Ghz frequencies
  query_parameters = {
    filter = "broadcastingFrequenciesGHz.containsAny(5, 6)"
    offset = 0
    limit  = 10
  }
}

module "wifi_broadcast_details" {
  source = "../../modules/wifi_details"

  for_each = { for wifi in module.wifi_broadcasts.wifi_broadcasts["data"] : wifi.id => wifi }

  site_id = module.sites.sites["data"][0]["id"]
  wifi_id = each.value.id
}
