module "pending_devices_adoption" {
  source = "../../modules/pending_devices"
}

module "adopt_device" {
  for_each = { for k, v in module.pending_devices_adoption.pending_devices_adoption["data"] : v.macAddress => v }

  source = "../../modules/adopt_device"

  site_id     = each.value.adoptionTargetSiteIds[0]
  mac_address = each.value.macAddress

  ignore_device_limit = true
}

action "restful_action" "adopt_device" {
  for_each = { for k, v in module.pending_devices_adoption.pending_devices_adoption["data"] : v.macAddress => v }

  config {
    method = "POST"
    path   = "/v1/sites/${each.value.adoptionTargetSiteIds[0]}/devices"
    body = jsonencode({
      mac               = each.value.macAddress
      ignoreDeviceLimit = true
    })
  }
}
