data "restful_resource" "radius_profiles" {
  id = "/v1/sites/${var.site_id}/radius/profiles"

  query = {
    for key, value in var.query_parameters :
    key => [value] if value != null
  }
}
