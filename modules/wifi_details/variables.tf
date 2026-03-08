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

variable "wifi_id" {
  description = <<DESCRIPTION
  ## Description

  Wifi Id.

  ## Example

  `2ef18ba7-616d-45fd-85e0-f5ce03e7f3e6`

  ## How to get the Wifi Id

  You can use the `wifi_broadcasts` sub-module to get the Wifi id.

  DESCRIPTION

  type     = string
  nullable = false
}
