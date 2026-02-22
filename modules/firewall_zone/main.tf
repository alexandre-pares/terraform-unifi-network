resource "restful_resource" "firewall_zone" {
  path = "/v1/sites/${var.site_id}/firewall/zones"

  body = {
    name       = var.name
    networkIds = var.network_ids
  }

  read_path = "$(path)/$(body.id)"
}

module "firewall_zone_details" {
  source = "../../modules/firewall_zone_details"

  site_id          = var.site_id
  firewall_zone_id = restful_resource.firewall_zone.output.id
}
