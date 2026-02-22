data "restful_resource" "sites" {
  id = "/v1/sites"

  query = {
    for key, value in var.query_parameters :
    key => [value] if value != null
  }
}
