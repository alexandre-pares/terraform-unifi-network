output "clients" {
  description = <<DESCRIPTION
  ## Description

  List of connected clients managed by the Unifi Network Application.

  ## Learn more

  https://developer.ui.com/network/v10.1.84/getconnectedclientoverviewpage

  ## Example

  ```hcl
  [
    {
      access         = {
        type = "DEFAULT"
      }
      connectedAt    = "2026-02-10T18:46:25Z"
      id             = "b8f25bd9-f045-38b4-9cec-dd887776c3ca"
      ipAddress      = "192.168.1.15"
      macAddress     = "00:e0:4c:00:00:ff"
      name           = "DESKTOP-ABCDEFG 00:FF"
      type           = "WIRED"
      uplinkDeviceId = "86fec8b1-95f8-3ec3-8dc7-9e5cdf6cd5b3"
    },
  ]
  ```

  DESCRIPTION

  value = module.clients.clients["data"]
}
