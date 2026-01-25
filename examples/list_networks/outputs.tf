output "networks" {
  description = <<DESCRIPTION
  ## Description

  List of local networks managed by the Unifi Network Application.

  ## Learn more

  https://developer.ui.com/network/v10.1.68/getnetworksoverviewpage

  ## Example

  ```hcl
  [
    {
      default    = true
      enabled    = true
      id         = "1a25e9d4-8864-49d5-abc4-fffc47905326"
      management = "GATEWAY"
      metadata   = {
          configurable = true
          origin       = "SYSTEM_DEFINED"
      }
      name       = "Default"
      vlanId     = 1
      zoneId     = "b54d3153-7f14-4aaf-9ceb-95a5a08d5519"
    }
  ]
  ```

  DESCRIPTION

  value = module.networks.networks["data"]
}
