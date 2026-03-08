output "client_details" {
  description = <<DESCRIPTION
  ## Description

  Details about a connected client.

  ## Learn more

  https://developer.ui.com/network/v10.1.84/getconnectedclientdetails

  ## Example

  ```hcl
  {
    access         = {
      type = "DEFAULT"
    }
    connectedAt    = "2026-02-13T03:35:11Z"
    id             = "250412f8-4682-3d03-b224-1907ba8420ff"
    ipAddress      = "192.168.1.33"
    macAddress     = "d8:c8:0c:00:00:ff"
    name           = "Tuya Smart Socket"
    type           = "WIRELESS"
    uplinkDeviceId = "86fec8b1-95f8-3ec3-8dc7-9e5cdf6cd5b3"
  }
  ```

  DESCRIPTION

  value = data.restful_resource.client_details.output
}
