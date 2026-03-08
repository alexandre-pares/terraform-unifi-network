data "restful_resource" "wifi_broadcast_details" {
  id = "/v1/sites/${var.site_id}/wifi/broadcasts/${var.wifi_id}"
}
