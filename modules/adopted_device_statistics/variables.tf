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

variable "device_id" {
  description = <<DESCRIPTION
  ## Description

  Device Id.

  ## Example

  `c94dadd5-4368-3273-bf77-d45d2e9e0cc1`

  ## How to get the device Id

  You can use the `adopted_devices` sub-module to get the device id.

  DESCRIPTION

  type     = string
  nullable = false
}
