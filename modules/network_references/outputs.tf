output "network_references" {
  description = <<DESCRIPTION
  ## Description

  References to a specific network.

  ## Learn more

  https://developer.ui.com/network/v10.1.84/getnetworkreferences

  ## Example

  ```hcl
  {
    referenceResources = [
      {
        referenceCount = 3
        references     = [
            {
              referenceId = "7468ddd6-4563-47b8-a146-1c7f097f1765"
            },
            {
              referenceId = "b1a91738-4008-4bf6-b93f-24d0c0f7f0f1"
            },
            {
              referenceId = "604a2754-8afe-4ae9-873a-22be1dd48043"
            },
          ]
        resourceType   = "WIFI"
      },
      {
        referenceCount = 1
        resourceType   = "OSPF_ROUTE"
      },
    ]
  }
  ```

  DESCRIPTION

  value = data.restful_resource.network_references.output
}
