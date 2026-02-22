output "dpi_application_categories" {
  description = <<DESCRIPTION
  ## Description

  List of DPI Application Categories managed by the Unifi Network Application.

  ## Learn more

  https://developer.ui.com/network/v10.1.84/getdpiapplicationcategories

  ## Example

  ```hcl
  {
    "count" = 20
    "data" = [
      {
        "id" = 0
        "name" = "Instant messengers"
      },
      {
        "id" = 1
        "name" = "Peer-to-peer networks"
      },
      {
        "id" = 3
        "name" = "File sharing services and tools"
      },
      {
        "id" = 4
        "name" = "Media streaming services"
      },
      {
        "id" = 5
        "name" = "Email messaging services"
      },
      {
        "id" = 6
        "name" = "VoIP services"
      },
      {
        "id" = 7
        "name" = "Database tools"
      },
      {
        "id" = 8
        "name" = "Online games"
      },
      {
        "id" = 9
        "name" = "Management tools and protocols"
      },
      {
        "id" = 10
        "name" = "Remote access terminals"
      },
      {
        "id" = 11
        "name" = "Tunneling and proxy services"
      },
      {
        "id" = 12
        "name" = "Investment platforms"
      },
      {
        "id" = 13
        "name" = "Web services"
      },
      {
        "id" = 14
        "name" = "Security update tools"
      },
      {
        "id" = 15
        "name" = "Web instant messengers"
      },
      {
        "id" = 17
        "name" = "Business tools"
      },
      {
        "id" = 18
        "name" = "Network protocols"
      },
      {
        "id" = 19
        "name" = "Network protocols"
      },
      {
        "id" = 20
        "name" = "Network protocols"
      },
      {
        "id" = 22
        "name" = "Adult"
      },
    ]
    "limit" = 20
    "offset" = 0
    "totalCount" = 35
  }
  ```

  DESCRIPTION

  value = data.restful_resource.dpi_application_categories.output
}
