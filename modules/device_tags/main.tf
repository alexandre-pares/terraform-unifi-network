data "restful_resource" "device_tags" {
  id = "/v1/sites/${var.site_id}/device-tags"

  query = {
    for key, value in var.query_parameters :
    key => [value] if value != null
  }
}
