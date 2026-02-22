data "restful_resource" "dpi_application_categories" {
  id = "/v1/dpi/categories"

  query = {
    for key, value in var.query_parameters :
    key => [value] if value != null
  }
}
