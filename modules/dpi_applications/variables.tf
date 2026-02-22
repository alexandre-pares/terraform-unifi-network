variable "query_parameters" {
  description = <<DESCRIPTION
  ## Description

  Query parameters to be sent with the API request.

  ## Example

  ```hcl
  {
    offset = 10
    limit  = 20
    filter = "name.like('*Apple*')"
  }
  ```

  DESCRIPTION

  type = object({
    offset = optional(number)
    limit  = optional(number)
    filter = optional(string)
  })
  nullable = false
  default  = {}
}
