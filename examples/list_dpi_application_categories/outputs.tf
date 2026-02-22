output "dpi_application_categories" {
  description = <<DESCRIPTION
  ## Description

  List of DPI Application Categories managed by the Unifi Network Application.

  ## Learn more

  https://developer.ui.com/network/v10.1.84/getdpiapplicationcategories

  ## Example

  ```hcl
  [
    {
      "id" = 3
      "name" = "File sharing services and tools"
    },
    {
      "id" = 7
      "name" = "Database tools"
    },
    {
      "id" = 9
      "name" = "Management tools and protocols"
    },
    {
      "id" = 14
      "name" = "Security update tools"
    },
    {
      "id" = 17
      "name" = "Business tools"
    },
  ]
  ```

  DESCRIPTION

  value = module.dpi_application_categories.dpi_application_categories["data"]
}
