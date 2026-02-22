output "device_tags" {
  description = <<DESCRIPTION
  ## Description

  List of Device Tags managed by the Unifi Network Application.

  ## Learn more

  https://developer.ui.com/network/v10.1.84/getdevicetagpage

  ## Example

  ```hcl
  {
    "count" = 0
    "data" = []
    "limit" = 20
    "offset" = 0
    "totalCount" = 0
  }
  ```

  DESCRIPTION

  value = data.restful_resource.device_tags.output
}
