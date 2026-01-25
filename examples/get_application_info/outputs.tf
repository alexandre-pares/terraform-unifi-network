output "unifi_application_version" {
  description = <<DESCRIPTION
  ## Description

  The version of the Unifi application.

  ## Example

  `10.1.68`

  DESCRIPTION

  value = module.application_info.application_info["applicationVersion"]
}
