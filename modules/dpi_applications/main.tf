data "restful_resource" "dpi_applications" {
  id = "/v1/dpi/applications"

  query = {
    for key, value in var.query_parameters :
    key => [value] if value != null
  }
}
