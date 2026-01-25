locals {
  base_url = {
    # Remote use Unifi API as a proxy
    # This is the prefered method if you don't have a direct connection to your Unifi Console
    remote = "https://api.ui.com/v1/connector/consoles/${var.console_id}/proxy/network/integration"

    # Local use a direct connection to your Unifi Console
    # This is the prefered method if you have a direct connection to your Unifi Console
    local = "https://${var.console_ip}/proxy/network/integration"
  }
}
