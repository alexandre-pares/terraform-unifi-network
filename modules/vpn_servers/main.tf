data "restful_resource" "vpn_servers" {
  id = "/v1/sites/${var.site_id}/vpn/servers"

  query = {
    for key, value in var.query_parameters :
    key => [value] if value != null
  }
}
