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

variable "firewall_zone_id" {
  description = <<DESCRIPTION
  ## Description

  Firewall Zone Id.

  ## Example

  `3696e479-13b4-4aaa-aa74-093bbff7f45a`

  ## How to get the firewall zone Id

  You can use the `firewall_zones` sub-module to get the firewall zone id.

  DESCRIPTION

  type     = string
  nullable = false
}
