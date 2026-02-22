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

variable "query_parameters" {
  description = <<DESCRIPTION
  ## Description

  Query parameters to be sent with the API request.

  ## Example

  ```hcl
  {
    offset = 10
    limit  = 20
    filter = ""
  }
  ```

  DESCRIPTION

  type = object({
    offset = optional(number)
    limit  = optional(number)
    filter = optional(string)
  })
  nullable = false
  default  = {}
}
