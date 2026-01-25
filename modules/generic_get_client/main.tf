data "restful_resource" "generic_get_client" {
  id = var.path

  query = {
    for key, value in var.query_parameters : key => [value]
  }
}
