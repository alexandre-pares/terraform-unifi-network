ephemeral "restful_resource" "adopted_device_statistics" {
  path           = "/v1/sites/${var.site_id}/devices/${var.device_id}/statistics/latest"
  method         = "GET"
  expiry_type    = "time"
  expiry_locator = "body.nextHeartbeatAt"
  renew_method   = "GET"
  renew_path     = "$(path)"
}
