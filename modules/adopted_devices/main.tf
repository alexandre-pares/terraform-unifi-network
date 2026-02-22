data "restful_resource" "adopted_devices" {
  id = "/v1/sites/${var.site_id}/devices"

  query = {
    for key, value in var.query_parameters :
    key => [value] if value != null
  }
}
