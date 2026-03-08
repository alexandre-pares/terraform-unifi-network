data "restful_resource" "clients" {
  id = "/v1/sites/${var.site_id}/clients"

  query = {
    for key, value in var.query_parameters :
    key => [value] if value != null
  }
}
