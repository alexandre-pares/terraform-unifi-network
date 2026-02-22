output "device_tags" {
  description = <<DESCRIPTION
  ## Description

  List of Device Tags managed by the Unifi Network Application.

  ## Learn more

  https://developer.ui.com/network/v10.1.84/getdevicetagpage

  ## Example

  ```hcl
  []
  ```

  DESCRIPTION

  value = module.device_tags.device_tags["data"]
}
