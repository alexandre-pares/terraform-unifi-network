data "restful_resource" "firewall_zone_details" {
  id = "/v1/sites/${var.site_id}/firewall/zones/${var.firewall_zone_id}"
}
