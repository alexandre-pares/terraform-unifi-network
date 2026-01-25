output "sites" {
  description = <<DESCRIPTION
  ## Description

  List of local sites managed by the Unifi Network Application.

  ## Learn more

  https://developer.ui.com/network/v10.1.68/getsiteoverviewpage

  ## Example

  ```hcl
  {
    "offset"      = 0,
    "limit"       = 0,
    "count"       = 1,
    "totalCount"  = 1,
    "data"        = [
      {
        "id"                = "4c2d331d-6cdc-39d5-ae48-7457ff007b02",
        "internalReference" = "default",
        "name"              = "Default"
      }
    ]
  }
  ```

  DESCRIPTION

  value = data.restful_resource.sites.output
}
