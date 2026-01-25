data "restful_resource" "adopted_device_statistics" {
  id = "/v1/sites/${var.site_id}/devices/${var.device_id}/statistics/latest"
}
