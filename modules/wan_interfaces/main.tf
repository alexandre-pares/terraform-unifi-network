data "restful_resource" "wan_interfaces" {
  id = "/v1/sites/${var.site_id}/wans"

  query = {
    for key, value in var.query_parameters :
    key => [value] if value != null
  }
}
