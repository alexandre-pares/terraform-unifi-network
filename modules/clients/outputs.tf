output "clients" {
  description = <<DESCRIPTION
  ## Description

  List of connected clients managed by the Unifi Network Application.

  ## Learn more

  https://developer.ui.com/network/v10.1.84/getconnectedclientoverviewpage

  ## Example

  ```hcl
  {
    count      = 5
    data       = [
      {
        access         = {
          type = "DEFAULT"
        }
        connectedAt    = "2026-02-10T18:46:25Z"
        id             = "b8f25bd9-f045-38b4-9cec-dd887776c3ca"
        ipAddress      = "192.168.1.74"
        macAddress     = "00:e0:4c:00:00:ff"
        name           = "DESKTOP-ABCDE 00:FF"
        type           = "WIRED"
        uplinkDeviceId = "86fec8b1-95f8-3ec3-8dc7-9e5cdf6cd5b3"
      },
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
      },
      {
        access         = {
          type = "DEFAULT"
        }
        connectedAt    = "2026-02-13T03:35:11Z"
        id             = "5f1e58ab-17dd-39ae-a52a-4e0b5bc15bda"
        ipAddress      = "192.168.1.144"
        macAddress     = "d8:c8:0c:00:00:ff"
        name           = "Tuya Smart Socket"
        type           = "WIRELESS"
        uplinkDeviceId = "86fec8b1-95f8-3ec3-8dc7-9e5cdf6cd5b3"
      },
      {
        access         = {
          type = "DEFAULT"
        }
        connectedAt    = "2026-02-13T03:35:11Z"
        id             = "5762cc68-f9a9-3929-9df9-60ae56e6275b"
        ipAddress      = "192.168.1.204"
        macAddress     = "d8:1f:12:00:00:ff"
        name           = "Tuya Smart Bulb"
        type           = "WIRELESS"
        uplinkDeviceId = "86fec8b1-95f8-3ec3-8dc7-9e5cdf6cd5b3"
      },
      {
        access         = {
          type = "DEFAULT"
        }
        connectedAt    = "2026-02-13T03:35:11Z"
        id             = "001f56eb-33da-3343-9862-79a44a6c08f7"
        ipAddress      = "192.168.1.233"
        macAddress     = "d8:1f:12:00:00:ff"
        name           = "Tuya Smart Bulb"
        type           = "WIRELESS"
        uplinkDeviceId = "86fec8b1-95f8-3ec3-8dc7-9e5cdf6cd5b3"
      },
    ]
    limit      = 5
    offset     = 0
    totalCount = 18
  }
  ```

  DESCRIPTION

  value = data.restful_resource.clients.output
}
