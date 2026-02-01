resource "restful_resource" "network" {
  path = "/v1/sites/${var.site_id}/networks"

  body = local.network_properties

  read_path = "$(path)/$(body.id)"
}

module "network_details" {
  source = "../network_details"

  site_id    = var.site_id
  network_id = restful_resource.network.output.id
}
