variable "site_id" {
  description = <<DESCRIPTION
  ## Description

  Unifi site Id.

  ## Example

  `4c2d331d-6cdc-39d5-ae48-7457ff007b02`

  ## How to get the site Id

  You can use the `sites` sub-module to get the site id.

  DESCRIPTION

  type     = string
  nullable = false
}

variable "mac_address" {
  description = <<DESCRIPTION
  ## Description

  MAC address of the device to be adopted.

  ## Example

  `d8:b3:70:ff:ff:ff`

  DESCRIPTION

  type     = string
  nullable = false
}

variable "ignore_device_limit" {
  description = <<DESCRIPTION
  ## Description

  Whether to ignore the device limit when adopting a new device.

  ## Example

  `true`

  DESCRIPTION

  type     = bool
  nullable = false
  default  = false
}
