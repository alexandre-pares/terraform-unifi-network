variable "path" {
  description = <<DESCRIPTION
  ## Description

  API endpoint path.

  ## Example

  `/v1/sites/5f7d3a2e4c6b3a00123abcd4/networks/1a25e9d4-8864-49d5-abc4-fffc47905326/references`

  ## How to get API endpoint path

  Navigate the Official Unifi Network API documentation and search for the correspondig endpoint path.

  - https://unifi.ui.com/settings/api-docs
  - https://192.168.1.1/unifi-api/network (Assuming 192.168.1.1 is your Unifi Console IP)

  DESCRIPTION

  type     = string
  nullable = false
}

variable "query_parameters" {
  description = <<DESCRIPTION
  ## Description

  Query parameters to be sent with the API request.

  ## Example

  ```hcl
  {
    offset = 10
    limit  = 20
    filter = "metadata.origin.eq('SYSTEM_DEFINED')"
  }
  ```

  DESCRIPTION

  type     = map(string)
  nullable = false
  default  = {}
}
