output "countries" {
  description = <<DESCRIPTION
  ## Description

  List of  ISO-standard country codes and names, used for region-based configuration or regulatory compliance.

  ## Learn more

  https://developer.ui.com/network/v10.1.84/getcountries

  ## Example

  ```hcl
  {
    "count" = 25
    "data" = [
      {
        "code" = "AD"
        "name" = "Andorra"
      },
      {
        "code" = "AE"
        "name" = "United Arab Emirates"
      },
      {
        "code" = "AF"
        "name" = "Afghanistan"
      },
      {
        "code" = "AG"
        "name" = "Antigua and Barbuda"
      },
      {
        "code" = "AI"
        "name" = "Anguilla"
      },
      {
        "code" = "AL"
        "name" = "Albania"
      },
      {
        "code" = "AM"
        "name" = "Armenia"
      },
      {
        "code" = "AO"
        "name" = "Angola"
      },
      {
        "code" = "AQ"
        "name" = "Antarctica"
      },
      {
        "code" = "AR"
        "name" = "Argentina"
      },
      {
        "code" = "AS"
        "name" = "American Samoa"
      },
      {
        "code" = "AT"
        "name" = "Austria"
      },
      {
        "code" = "AU"
        "name" = "Australia"
      },
      {
        "code" = "AW"
        "name" = "Aruba"
      },
      {
        "code" = "AX"
        "name" = "Åland Islands"
      },
      {
        "code" = "AZ"
        "name" = "Azerbaijan"
      },
      {
        "code" = "BA"
        "name" = "Bosnia and Herzegovina"
      },
      {
        "code" = "BB"
        "name" = "Barbados"
      },
      {
        "code" = "BD"
        "name" = "Bangladesh"
      },
      {
        "code" = "BE"
        "name" = "Belgium"
      },
      {
        "code" = "BF"
        "name" = "Burkina Faso"
      },
      {
        "code" = "BG"
        "name" = "Bulgaria"
      },
      {
        "code" = "BH"
        "name" = "Bahrain"
      },
      {
        "code" = "BI"
        "name" = "Burundi"
      },
      {
        "code" = "BJ"
        "name" = "Benin"
      },
    ]
    "limit" = 25
    "offset" = 0
    "totalCount" = 248
  }
  ```

  DESCRIPTION

  value = data.restful_resource.countries.output
}
