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

variable "client_id" {
  description = <<DESCRIPTION
  ## Description

  Client Id.

  ## Example

  `001f56eb-33da-3343-9862-79a44a6c08f7`

  ## How to get the client Id

  You can use the `clients` sub-module to get the client id.

  DESCRIPTION

  type     = string
  nullable = false
}
