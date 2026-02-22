output "radius_profiles" {
  description = <<DESCRIPTION
  ## Description

  List of Radius Profiles managed by the Unifi Network Application.

  ## Learn more

  https://developer.ui.com/network/v10.1.84/getradiusprofileoverviewpage

  ## Example

  ```hcl
  [
    {
      "id" = "be65ef3f-6ff4-49ff-a470-9af840551e6f"
      "metadata" = {
        "configurable" = true
        "origin" = "SYSTEM_DEFINED"
      }
      "name" = "Default"
    }
  ]
  ```

  DESCRIPTION

  value = module.radius_profiles.radius_profiles["data"]
}
