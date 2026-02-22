# Create Firewall zones using the firewall zone module
module "firewall_zone" {
  source = "./modules/firewall_zone"

  for_each = var.firewall_zones

  site_id     = var.site_id
  name        = each.value.name
  network_ids = try(each.value.network_ids, [])
}
