data "restful_resource" "networks" {
  id = "/v1/sites/${var.site_id}/networks"

  query = {
    for key, value in var.query_parameters :
    key => [value] if value != null
  }
}
