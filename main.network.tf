# Create networks using the network module
module "network" {
  source   = "./modules/network"
  for_each = var.networks

  site_id = var.site_id

  management_type        = each.value.management_type
  name                   = each.value.name
  vlan_id                = each.value.vlan_id
  dhcp_guarding          = try(each.value.dhcp_guarding, null)
  device_id              = try(each.value.device_id, null)
  enabled                = try(each.value.enabled, true)
  enable_cellular_backup = try(each.value.enable_cellular_backup, null)
  enable_mdns_forwarding = try(each.value.enable_mdns_forwarding, null)
  enable_isolation       = try(each.value.enable_isolation, null)
  enable_internet_access = try(each.value.enable_internet_access, null)
  firewall_zone_id       = try(each.value.firewall_zone_id, null)
  ipv4_configuration     = try(each.value.ipv4_configuration, null)
  ipv6_configuration     = try(each.value.ipv6_configuration, null)
}
