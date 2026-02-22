output "radius_profiles" {
  description = <<DESCRIPTION
  ## Description

  List of Radius Profiles managed by the Unifi Network Application.

  ## Learn more

  https://developer.ui.com/network/v10.1.84/getradiusprofileoverviewpage

  ## Example

  ```hcl
  {
    "count" = 3
    "data" = [
      {
        "id" = "be65ef3f-6ff4-49ff-a470-9af840551e6f"
        "metadata" = {
          "configurable" = true
          "origin" = "SYSTEM_DEFINED"
        }
        "name" = "Default"
      },
      {
        "id" = "8ba565bb-678a-4e02-b600-c0f46fe06a49"
        "metadata" = {
          "origin" = "DERIVED"
        }
        "name" = "UID"
      },
      {
        "id" = "0935d3e6-c705-4bb2-9262-8a0d3eb4d73f"
        "metadata" = {
          "origin" = "USER_DEFINED"
        }
        "name" = "Orion-AAA"
      },
    ]
    "limit" = 20
    "offset" = 0
    "totalCount" = 3
  }
  ```

  DESCRIPTION

  value = data.restful_resource.radius_profiles.output
}
