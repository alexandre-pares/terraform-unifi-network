output "countries" {
  description = <<DESCRIPTION
  ## Description

  List of  ISO-standard country codes and names, used for region-based configuration or regulatory compliance.

  ## Learn more

  https://developer.ui.com/network/v10.1.84/getcountries

  ## Example

  ```hcl
  [
    {
      "code" = "CH"
      "name" = "Switzerland"
    },
    {
      "code" = "SE"
      "name" = "Sweden"
    },
    {
      "code" = "SZ"
      "name" = "Swaziland"
    },
  ]
  ```

  DESCRIPTION

  value = module.countries.countries
}
