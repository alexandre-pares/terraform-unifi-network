data "restful_resource" "wifi_broadcasts" {
  id = "/v1/sites/${var.site_id}/wifi/broadcasts"

  query = {
    for key, value in var.query_parameters :
    key => [value] if value != null
  }
}
