action "restful_action" "adopt_device" {
  config {
    method = "POST"
    path   = "/v1/sites/${var.site_id}/devices"
    body = jsonencode({
      mac               = var.mac_address
      ignoreDeviceLimit = var.ignore_device_limit
    })
  }
}
