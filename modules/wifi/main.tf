resource "restful_resource" "wifi_broadcast" {
  path = "/v1/sites/${var.site_id}/wifi/broadcasts"

  body           = {}
  ephemeral_body = local.wifi_properties

  read_path = "$(path)/$(body.id)"
}

module "wifi_details" {
  source = "../wifi_details"

  site_id = var.site_id
  wifi_id = restful_resource.wifi_broadcast.output.id
}
