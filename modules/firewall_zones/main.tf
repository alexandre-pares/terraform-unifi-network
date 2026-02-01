data "restful_resource" "firewall_zones" {
  id = "/v1/sites/${var.site_id}/firewall/zones"

  query = {
    for key, value in var.query_parameters :
    key => [value] if value != null
  }
}
