output "adopted_device_details" {
  description = <<DESCRIPTION
  ## Description

  Details about an adopted device.

  ## Learn more

  https://developer.ui.com/network/v10.1.68/getadopteddevicedetails

  ## Example

  ```hcl
  {
    "id"                = "c94dadd5-4368-3273-bf77-d45d2e9e0cc1"
    "macAddress"        = "d8:b3:70:ff:ff:ff"
    "ipAddress"         = "192.168.1.10"
    "name"              = "USW Flex 2.5G 5"
    "model"             = "USW Flex 2.5G 5"
    "supported"         = true
    "state"             = "ONLINE"
    "firmwareVersion"   = "2.1.8"
    "firmwareUpdatable" = false
    "adoptedAt"         = "2025-11-19T22:34:26Z"
    "provisionedAt"     = "2025-12-22T12:55:26Z"
    "configurationId"   = "1a2b3c4d5e6f"
    "uplink"            = {
      "deviceId" = "c06642ce-eff0-395d-b76e-451d2e4ff993"
    },
    "features"          = {
      "switching"   = {},
      "accessPoint" = {}
    },
    "interfaces"        = {
      "ports" = [
        {
          "idx"           = 1,
          "state"         = "UP",
          "connector"     = "RJ45",
          "maxSpeedMbps"  = 2500,
          "speedMbps"     = 2500
        },
        {
          "idx"           = 2,
          "state"         = "UP",
          "connector"     = "RJ45",
          "maxSpeedMbps"  = 2500,
          "speedMbps"     = 2500
        },
        {
          "idx"           = 3,
          "state"         = "DOWN",
          "connector"     = "RJ45",
          "maxSpeedMbps"  = 2500,
        },
        {
          "idx"           = 3,
          "state"         = "DOWN",
          "connector"     = "RJ45",
          "maxSpeedMbps"  = 2500
        },
        {
          "idx"           = 4,
          "state"         = "DOWN",
          "connector"     = "RJ45",
          "maxSpeedMbps"  = 2500
        },
        {
          "idx"           = 5,
          "state"         = "DOWN",
          "connector"     = "RJ45",
          "maxSpeedMbps"  = 2500
        }
      ]
    }
  }
  ```

  DESCRIPTION

  value = data.restful_resource.adopted_device_details.output
}
