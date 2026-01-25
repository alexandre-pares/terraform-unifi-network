output "pending_devices_adoption" {
  description = <<DESCRIPTION
  ## Description

  List of devices pending adoption on an Unifi Network Application.

  ## Learn more

  https://developer.ui.com/network/v10.1.68/getpendingdevicepage

  ## Example

  ### 1 device pending adoption

  ```hcl
  {
    "offset"      = 0
    "limit"       = 25
    "count"       = 0
    "totalCount"  = 0
    "data"        = [
      {
        adoptionTargetSiteIds = [
            "4c2d331d-6cdc-39d5-ae48-7457ff007b02",
          ]
        features              = [
            "switching",
          ]
        firmwareUpdatable     = false
        firmwareVersion       = "2.1.8"
        ipAddress             = "192.168.1.10"
        macAddress            = "84:78:48:ff:ff:ff"
        model                 = "USW Flex 2.5G 5"
        state                 = "PENDING_ADOPTION"
        supported             = true
      }
    ]
  }
  ```

  ### No devices pending adoption

  ```hcl
  {
    "offset"      = 0
    "limit"       = 25
    "count"       = 0
    "totalCount"  = 0
    "data"        = []
  }
  ```

  DESCRIPTION

  value = data.restful_resource.pending_devices_adoption.output
}
