data "restful_resource" "network_details" {
  id = "/v1/sites/${var.site_id}/networks/${var.network_id}"
}
