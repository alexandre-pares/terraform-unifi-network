# Create WiFi broadcasts using the WiFi module
module "wifi_broadcast" {
  source   = "./modules/wifi"
  for_each = var.wifi_broadcasts

  site_id = var.site_id

  type                                   = try(each.value["type"], null)
  name                                   = each.value.name
  network                                = try(each.value.network, null)
  enabled                                = try(each.value.enabled, null)
  security_configuration                 = try(each.value.security_configuration, null)
  broadcasting_device_filter             = try(each.value.broadcasting_device_filter, null)
  mdns_proxy_configuration               = try(each.value.mdns_proxy_configuration, null)
  multicast_filtering_policy             = try(each.value.multicast_filtering_policy, null)
  enable_multicast_to_unicast_conversion = try(each.value.enable_multicast_to_unicast_conversion, null)
  enable_client_isolation                = try(each.value.enable_client_isolation, null)
  hide_wifi_name                         = try(each.value.hide_wifi_name, null)
  enable_uapsd                           = try(each.value.enable_uapsd, null)
  basic_data_rate_kbps_by_frequency_ghz  = try(each.value.basic_data_rate_kbps_by_frequency_ghz, null)
  client_filtering_policy                = try(each.value.client_filtering_policy, null)
  blackout_schedule_configuration        = try(each.value.blackout_schedule_configuration, null)
  broadcasting_frequencies_ghz           = try(each.value.broadcasting_frequencies_ghz, null)
  hotspot_configuration                  = try(each.value.hotspot_configuration, null)
  enable_mlo                             = try(each.value.enable_mlo, null)
  enable_band_steering                   = try(each.value.enable_band_steering, null)
  enable_arp_proxy                       = try(each.value.enable_arp_proxy, null)
  enable_bss_transition                  = try(each.value.enable_bss_transition, null)
  advertise_device_name                  = try(each.value.advertise_device_name, null)
  dtim_period_by_frequency_ghz_override  = try(each.value.dtim_period_by_frequency_ghz_override, null)
}
