data "restful_resource" "pending_devices_adoption" {
  id = "/v1/pending-devices"

  query = {
    for key, value in var.query_parameters :
    key => [value] if value != null
  }
}
