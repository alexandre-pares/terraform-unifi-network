output "application_info" {
  description = <<DESCRIPTION
  ## Description

  Unifi Application Information.

  ## Learn more

  https://developer.ui.com/network/v10.1.68/getinfo

  ## Example

  ```hcl
  {
    "applicationVersion" = "10.1.68"
  }
  ```

  DESCRIPTION


  value = data.restful_resource.application_info.output
}
