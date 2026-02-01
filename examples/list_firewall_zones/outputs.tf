output "firewall_zones" {
  description = <<DESCRIPTION
  ## Description

  List of Firewall Zones managed by the Unifi Network Application.

  ## Learn more

  https://developer.ui.com/network/v10.1.68/getfirewallzones

  ## Example

  ```hcl
  [
    {
        id         = "b62cfbb1-0595-4305-b169-5096a02c32f0"
        metadata   = {
            configurable = false
            origin       = "SYSTEM_DEFINED"
          }
        name       = "Vpn"
        networkIds = [
            "4364c229-e599-419c-9ff6-ca3f71d9b227",
            "a3e23929-73fd-419c-9189-1cd0383d6e15",
            "8e6c2a8c-4d97-43cf-8c52-069fe6ab97a3",
            "03cef337-1c71-450b-a3a6-fd8dd21375a7",
          ]
      },
      {
        id         = "04cce127-8b32-4923-acdc-d756e1fdf477"
        metadata   = {
            configurable = false
            origin       = "SYSTEM_DEFINED"
          }
        name       = "Gateway"
        networkIds = []
      },
      {
        id         = "9659342e-e499-464e-81c6-59e591c64759"
        metadata   = {
            configurable = true
            origin       = "SYSTEM_DEFINED"
          }
        name       = "Dmz"
        networkIds = []
      },
      {
        id         = "b53d9fba-9935-4889-96a9-f51a23b9470d"
        metadata   = {
            configurable = false
            origin       = "SYSTEM_DEFINED"
          }
        name       = "External"
        networkIds = [
            "249f6197-5348-49bb-be23-7f7e02155fe5",
            "351fc490-33f5-4ead-b243-c49318755243",
          ]
      },
      {
        id         = "854c48aa-687c-4520-b0c6-2d4dd324a0ec"
        metadata   = {
            configurable = true
            origin       = "SYSTEM_DEFINED"
          }
        name       = "Internal"
        networkIds = [
            "0ea04911-db4e-4365-81df-0bfd0afe55e8",
            "fa352a51-4acd-4b3c-aa18-a6e605aa256d",
            "10f1fbdd-3b22-4f41-9c9c-850693199bf1",
            "4e40e3c3-3d7d-49a3-8b81-544c3250450b",
            "1867e15d-bb79-4475-a223-dace9967dd0c",
            "9d7a459b-c265-444e-8629-ca681cd75fbf",
            "dc49f925-9a7c-413e-991e-c34e1af27cae",
          ]
      },
    {
      id         = "364c92e1-c819-4d07-a402-221903cb4a94"
      metadata   = {
          configurable = true
          origin       = "SYSTEM_DEFINED"
        }
      name       = "Hotspot"
      networkIds = [
          "f9bf0405-04f8-4076-8594-5a38e80065c4",
        ]
    },
  ]
  ```

  DESCRIPTION

  value = module.firewall_zones.firewall_zones["data"]
}


output "firewall_zones_by_name" {
  description = <<DESCRIPTION
  ## Description

  A map of Firewall Zones with key is the name

  ## Examples

  ```hcl
  {
    Dmz = {
      id         = "9659342e-e499-464e-81c6-59e591c64759"
      metadata   = {
        configurable = true
        origin       = "SYSTEM_DEFINED"
      }
      name       = "Dmz"
      networkIds = []
    }
    External = {
      id         = "b53d9fba-9935-4889-96a9-f51a23b9470d"
      metadata   = {
        configurable = false
        origin       = "SYSTEM_DEFINED"
      }
      name       = "External"
      networkIds = [
        "249f6197-5348-49bb-be23-7f7e02155fe5",
        "351fc490-33f5-4ead-b243-c49318755243",
      ]
    }
    Gateway = {
      id         = "04cce127-8b32-4923-acdc-d756e1fdf477"
      metadata   = {
        configurable = false
        origin       = "SYSTEM_DEFINED"
      }
      name       = "Gateway"
      networkIds = []
    }
    Hotspot = {
      id         = "364c92e1-c819-4d07-a402-221903cb4a94"
      metadata   = {
        configurable = true
        origin       = "SYSTEM_DEFINED"
      }
      name       = "Hotspot"
      networkIds = [
        "f9bf0405-04f8-4076-8594-5a38e80065c4",
      ]
    }
    Internal = {
      id         = "854c48aa-687c-4520-b0c6-2d4dd324a0ec"
      metadata   = {
        configurable = true
        origin       = "SYSTEM_DEFINED"
      }
      name       = "Internal"
      networkIds = [
        "0ea04911-db4e-4365-81df-0bfd0afe55e8",
        "fa352a51-4acd-4b3c-aa18-a6e605aa256d",
        "10f1fbdd-3b22-4f41-9c9c-850693199bf1",
        "4e40e3c3-3d7d-49a3-8b81-544c3250450b",
        "1867e15d-bb79-4475-a223-dace9967dd0c",
        "9d7a459b-c265-444e-8629-ca681cd75fbf",
        "dc49f925-9a7c-413e-991e-c34e1af27cae",
      ]
    }
    Vpn = {
      id         = "b62cfbb1-0595-4305-b169-5096a02c32f0"
      metadata   = {
        configurable = false
        origin       = "SYSTEM_DEFINED"
      }
      name       = "Vpn"
      networkIds = [
        "4364c229-e599-419c-9ff6-ca3f71d9b227",
        "a3e23929-73fd-419c-9189-1cd0383d6e15",
        "8e6c2a8c-4d97-43cf-8c52-069fe6ab97a3",
        "03cef337-1c71-450b-a3a6-fd8dd21375a7",
      ]
    }
  }
  ```

  DESCRIPTION

  value = {
    for k, v in module.firewall_zones.firewall_zones["data"] : v.name => v
  }
}
