output "dpi_applications" {
  description = <<DESCRIPTION
  ## Description

  List of DPI Applications managed by the Unifi Network Application.

  ## Learn more

  https://developer.ui.com/network/v10.1.84/getdpiapplications

  ## Example

  ```hcl
  [
    {
      "id" = 27
      "name" = "Apple iMessage"
    },
    {
      "id" = 262186
      "name" = "Apple Music"
    },
    {
      "id" = 262418
      "name" = "Apple TV+"
    },
    {
      "id" = 852052
      "name" = "Apple.com"
    },
    {
      "id" = 852078
      "name" = "Java Applet"
    },
    {
      "id" = 852128
      "name" = "Apple Store"
    },
    {
      "id" = 852221
      "name" = "Appledaily"
    },
    {
      "id" = 1179832
      "name" = "AppleTalk Routing Maintenance"
    },
    {
      "id" = 1179833
      "name" = "AppleTalk Name Binding"
    },
    {
      "id" = 1179834
      "name" = "AppleTalk Unused"
    },
    {
      "id" = 1179835
      "name" = "AppleTalk Echo"
    },
    {
      "id" = 1179836
      "name" = "AppleTalk Zone Information"
    },
    {
      "id" = 1179884
      "name" = "AppleShare IP WebAdmin"
    },
    {
      "id" = 1245221
      "name" = "Appletalk Update-Based Routing Pro."
    },
    {
      "id" = 1310898
      "name" = "ESS Apple(SSL)"
    },
  ]
  ```

  DESCRIPTION

  value = module.dpi_applications.dpi_applications["data"]
}
