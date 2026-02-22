output "wan_interfaces" {
  description = <<DESCRIPTION
  ## Description

  List of WAN interfaces managed by the Unifi Network Application.

  ## Learn more

  https://developer.ui.com/network/v10.1.84/getwansoverviewpage

  ## Example

  ```hcl
  [
    {
      "id" = "bff7d673-b686-467d-8da3-beeb6e806c4a"
      "name" = "SFP+ (WAN1)"
    },
    {
      "id" = "be4327f2-b53a-4812-b3b3-734fae66967c"
      "name" = "Unassigned (WAN2)"
    },
  ]
  ```

  DESCRIPTION

  value = module.wan_interfaces.wan_interfaces["data"]
}
