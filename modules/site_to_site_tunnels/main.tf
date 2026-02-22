data "restful_resource" "site_to_site_tunnels" {
  id = "/v1/sites/${var.site_id}/vpn/site-to-site-tunnels"

  query = {
    for key, value in var.query_parameters :
    key => [value] if value != null
  }
}
