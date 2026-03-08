data "restful_resource" "network_references" {
  id = "/v1/sites/${var.site_id}/networks/${var.network_id}/references"

  query = {
    for key, value in var.query_parameters :
    key => [value] if value != null
  }
}
