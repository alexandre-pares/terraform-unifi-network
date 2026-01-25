data "restful_resource" "networks" {
  id = "/v1/sites/${var.site_id}/networks"
}
