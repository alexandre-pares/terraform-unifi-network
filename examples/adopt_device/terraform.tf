terraform {
  required_version = "~> 1.14"

  required_providers {
    restful = {
      source  = "magodo/restful"
      version = "~> 0.25"
    }
  }
}

provider "restful" {
  base_url = local.base_url[var.endpoint_type]
  security = {
    apikey = [
      {
        in    = "header"
        name  = "X-API-Key"
        value = var.api_key
      }
    ]
  }
  client = {
    tls_insecure_skip_verify = var.endpoint_type == "local" ? true : false
  }
}
