output "site_to_site_tunnels" {
  description = <<DESCRIPTION
  ## Description

  List of Site-To-Sites Tunnels managed by the Unifi Network Application.

  ## Learn more

  https://developer.ui.com/network/v10.1.84/getsitetositevpntunnelpage

  ## Example

  ```hcl
  {
    "count" = 2
    "data" = [
      {
        "id" = "89fbdf21-6f51-4869-858e-87439799af4b"
        "metadata" = {
          "origin" = "USER_DEFINED"
        }
        "name" = "azure_1"
        "type" = "IPSEC"
      },
      {
        "id" = "cfcd560b-cdeb-46d2-9415-98082d39b6a3"
        "metadata" = {
          "origin" = "USER_DEFINED"
        }
        "name" = "azure_2"
        "type" = "IPSEC"
      },
    ]
    "limit" = 25
    "offset" = 0
    "totalCount" = 2
  }
  ```

  DESCRIPTION

  value = data.restful_resource.site_to_site_tunnels.output
}
