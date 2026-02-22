output "wan_interfaces" {
  description = <<DESCRIPTION
  ## Description

  List of WAN interfaces managed by the Unifi Network Application.

  ## Learn more

  https://developer.ui.com/network/v10.1.84/getwansoverviewpage

  ## Example

  ```hcl
  {
    "count" = 2
    "data" = [
      {
        "id" = "bff7d673-b686-467d-8da3-beeb6e806c4a"
        "name" = "SFP+ (WAN1)"
      },
      {
        "id" = "be4327f2-b53a-4812-b3b3-734fae66967c"
        "name" = "Unassigned (WAN2)"
      },
    ]
    "limit" = 25
    "offset" = 0
    "totalCount" = 2
  }
  ```

  DESCRIPTION

  value = data.restful_resource.wan_interfaces.output
}
