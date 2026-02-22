output "firewall_zone_details" {
  description = <<DESCRIPTION
  ## Description

  Map of Firewall Zone details.

  ## Learn more

  https://developer.ui.com/network/v10.1.84/getfirewallzonedetails

  ## Example

  ```hcl
  {
    fwz_hotspot_custom.yaml = {
      id = "857f712f-2f81-44a0-a16b-c4d00a9d8199"
      metadata = {
        origin = "USER_DEFINED"
      }
      name = "Hotspot_custom"
      networkIds = []
    }
    fwz_internal_custom.yaml = {
      id = "c0ee79a3-b05d-4133-8ad9-fa87b35c4eee"
      metadata = {
        origin = "USER_DEFINED"
      }
      name = "Internal_custom"
      networkIds = []
    }
    vpn_custom = {
      id = "bd172af0-0fdf-426c-a89c-42d438a572d4"
      metadata = {
        origin = "USER_DEFINED"
      }
      name = "Vpn_custom"
      networkIds = []
    }
  }
  ```

  DESCRIPTION

  value = {
    for name, firewall_zone in module.firewall_zone :
    name => firewall_zone.firewall_zone_details
  }
}
