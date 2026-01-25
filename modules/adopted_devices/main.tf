data "restful_resource" "adopted_devices" {
  id = "/v1/sites/${var.site_id}/devices"
}
