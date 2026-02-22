output "vpn_servers" {
  description = <<DESCRIPTION
  ## Description

  List of VPN Servers managed by the Unifi Network Application.

  ## Learn more

  https://developer.ui.com/network/v10.1.84/getvpnserverpage

  ## Example

  ```hcl
  {
    "count" = 1
    "data" = [
      {
        "enabled" = true
        "id" = "d8f62b6a-4c4a-4dcb-8ca4-bf957433940e"
        "metadata" = {
          "origin" = "USER_DEFINED"
        }
        "name" = "One-Click VPN"
        "type" = "WIREGUARD"
      },
    ]
    "limit" = 20
    "offset" = 0
    "totalCount" = 1
  }
  ```

  DESCRIPTION

  value = data.restful_resource.vpn_servers.output
}
