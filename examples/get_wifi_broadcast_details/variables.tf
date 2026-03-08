variable "console_id" {
  description = <<DESCRIPTION
  ## Description

  Unifi Console ID.

  This is only required if `var.endpoint_type` is  `remote`.

  ## Example

  ``

  DESCRIPTION

  type      = string
  nullable  = false
  sensitive = false
  default   = ""
}

variable "console_ip" {
  description = <<DESCRIPTION
  ## Description

  (local) IP Address of your Unifi Console.
  This is only required if `var.endpoint_type` is `local`.

  ## Example

  `192.168.0.1`

  DESCRIPTION

  type      = string
  nullable  = false
  sensitive = false
  default   = ""

  validation {
    # Use the cidrhost built-in terraform function to validate the IP address
    # This will only work for IPv4 addresses
    condition     = var.console_ip == "" || var.console_ip == cidrhost("${var.console_ip}/32", 0)
    error_message = "This is not a valid IP address"
  }
}

variable "api_key" {
  description = <<DESCRIPTION
  ## Description

  Unifi Network API Key.
  Please note that API key generated from the Unifi Site Manager can only be used on the remote API endpoint
  and API key generated from the location Unifi Console can only be used on the local API endpoint.

  ## Create an Remote API Key

  To create a remote API key follow the instructions below:
  1. Login to your Unifi Site Manager
  2. Navigate to Settings > API Keys
  3. (Optional) If you have multiples Fabrics (Previously called Organizations), select the desired Fabric from the dropdown or select "Independent Sites"
  4. Click on "Create New API Key"
  5. Provide a name (e.g. `tf-unifi-network`) and check "Unifi Applications"
  6. Under "Expiration", select the desired expiration (e.g. `1 Month`)
  7. Under Applications, select "Network"
  8. (Optional) Under "Sites", select specific sites or leave it to "All"
  9. Click on "Create" and copy the generated API Key

  ## Create a Local API Key
  To create a local API key follow the instructions below:
  1. Login to your Unifi Console using the local IP
  2. Navigate to Integrations
  3. Click on "Create New API Key"
  4. Provide a name (e.g. `tf-local-unifi-network`)
  5. (Optional) Provide a description
  6. Under "Expiration", select the desired expiration (e.g. `1 Month`)
  7. Click on "Create" and copy the generated API Key

  ## Security Note

  Never share your API key publicly (or commit it to GitHub).

  DESCRIPTION

  type      = string
  nullable  = false
  sensitive = true
}

variable "endpoint_type" {
  description = <<DESCRIPTION
  ## Description

  Type of endpoint to use for API requests to your Unifi Console.

  Available options are:

  - `remote`: Use the Unifi API as a proxy to connect to your Unifi Console. This is the preferred method if you don't have a direct connection to your Unifi Console.
  - `local`: Use a direct connection to your Unifi Console. This is the preferred method if you have a direct connection to your Unifi Console.

  ## Example

  `remote`
  `local`

  DESCRIPTION

  type      = string
  nullable  = false
  sensitive = false
  default   = "remote"

  validation {
    condition     = contains(["remote", "local"], var.endpoint_type)
    error_message = "Invalid endpoint_type. Allowed values are 'remote' or 'local'."
  }
}
