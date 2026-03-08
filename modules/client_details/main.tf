data "restful_resource" "client_details" {
  id = "/v1/sites/${var.site_id}/clients/${var.client_id}"
}
