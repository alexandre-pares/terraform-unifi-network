output "unifi_local_sites" {
  description = <<DESCRIPTION
  ## Description

  List of local sites managed by the Unifi Network Application.

  ## Example

  ```hcl
  [
    {
      "id"                = "4c2d331d-6cdc-39d5-ae48-7457ff007b02"
      "internalReference" = "default"
      "name"              = "Default"
    }
  ]
  ```

  DESCRIPTION

  value = module.sites.sites["data"]
}
