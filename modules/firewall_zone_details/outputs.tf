output "firewall_zone_details" {
  description = <<DESCRIPTION
  ## Description

  Details about a firewall zone.

  ## Learn more

  https://developer.ui.com/network/v10.1.84/getfirewallzone

  ## Example

  ```hcl
  {
    id         = "5aa9437d-7d50-425f-bfaf-d3d6bd487a87"
    metadata   = {
      configurable = false
      origin       = "SYSTEM_DEFINED"
    }
    name       = "Vpn"
    networkIds = [
      "3cacfc0f-e5a0-4958-adb9-901e6a090a92",
      "ccf067c6-fb2c-4a24-b9b2-f209b489a0f7",
      "c43cbc22-fa89-493e-b38f-9e4a720b9bb3",
      "a4df7e6d-09dd-4476-8311-1f0298b00831",
    ]
  }
  ```

  DESCRIPTION

  value = data.restful_resource.firewall_zone_details.output
}
