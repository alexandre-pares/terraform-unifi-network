# Get the default site by the Unifi Network Application.
module "default_sites" {
  source = "../../modules/sites"

  query_parameters = {
    filter = "name.eq('Default')"
  }
}

# Get the Hotspot firewall zone (automatically created by Unifi)
module "hotspot_firewall_zone" {
  source = "../../modules/firewall_zones"

  site_id = local.default_unifi_site_id

  query_parameters = {
    filter = "and(name.eq('Hotspot'), metadata.origin.eq('SYSTEM_DEFINED'))"
  }
}

module "wifi_capable_devices" {
  source = "../../modules/adopted_devices"

  site_id = local.default_unifi_site_id

  query_parameters = {
    filter = "features.contains('accessPoint')"
  }
}

# Create a Guest Network (used as example for WiFi and lookup for PPSK WiFi network)
module "guest_network" {
  source = "../../modules/network"

  site_id                = local.default_unifi_site_id
  management_type        = "GATEWAY"
  name                   = "Guest Network"
  enabled                = true
  vlan_id                = 123
  enable_isolation       = false
  enable_cellular_backup = false
  firewall_zone_id       = module.hotspot_firewall_zone.firewall_zones["data"][0]["id"]
  enable_internet_access = true
  enable_mdns_forwarding = false
  ipv4_configuration = {
    enable_auto_scale = true
    host_ip_address   = "192.168.10.1"
    prefix_length     = 24

    dhcp_configuration = {
      mode = "SERVER"

      ip_address_range = {
        start = "192.168.10.2"
        stop  = "192.168.10.254"
      }

      lease_time_seconds = 86400

      enable_ping_conflict_detection = true
    }
  }
}

module "wifi_broadcast" {
  source = "../../modules/wifi"

  for_each = merge(local.wifi_broadcasts, local.wifi_data_map)

  site_id                                = local.default_unifi_site_id
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
