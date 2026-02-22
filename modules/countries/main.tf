data "restful_resource" "countries" {
  id = "/v1/countries"

  query = {
    for key, value in var.query_parameters :
    key => [value] if value != null
  }
}
