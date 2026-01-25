output "unifi_adopted_devices" {
  description = <<DESCRIPTION
  ## Description

  List of adopted devices for a specific site hosted by a Unifi Application.

  ## Example

  ```hcl
  [
    {
      "id"                = "c94dadd5-4368-3273-bf77-d45d2e9e0cc1"
      "macAddress"        = "d8:b3:70:ff:ff:ff"
      "ipAddress"         = "192.168.1.10"
      "name"              = "USW Flex 2.5G 5"
      "model"             = "USW Flex 2.5G 5"
      "state"             = "ONLINE"
      "supported"         = true
      "firmwareVersion"   = "2.1.8"
      "firmwareUpdatable" = false
      "features"          = [
        "switching"
      ],
      "interfaces"        = [
        "ports"
      ]
    },
    {
      "id"                = "c06642ce-eff0-395d-b76e-451d2e4ff993"
      "macAddress"        = "94:2a:6f:ff:ff:ff"
      "ipAddress"         = "1.2.3.4" # Looks like the WAN IPv4 (didn't check when having 2 WANs)
      "name"              = "UDR7"
      "model"             = "UDR7"
      "state"             = "ONLINE"
      "supported"         = true
      "firmwareVersion"   = "5.0.12"
      "firmwareUpdatable" = false
      "features"          = [
        "switching",
        "accessPoint"
      ],
      "interfaces"        = [
        "ports",
        "radio"
      ]
    }
  ]
  ```

  DESCRIPTION

  value = module.adopted_devices.adopted_devices["data"]
}
