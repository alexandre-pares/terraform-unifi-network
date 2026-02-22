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

variable "name" {
  description = <<DESCRIPTION
  ## Description

  Name of the firewall zone

  ## Example

  `Internal_custom`

  DESCRIPTION

  type     = string
  nullable = false
}

variable "network_ids" {
  description = <<DESCRIPTION
  ## Description

  List of network id to attach to the firewall zone.

  ## Example

  ```hcl
  [
    "023e8518-9baf-4b0d-8a2a-a89449023e9e",
    "529e1d59-0baa-4353-a1e6-3aca4297eea1"
  ]
  ```

  ## Default

  `[]`

  DESCRIPTION

  type     = list(string)
  nullable = false
  default  = []
}
