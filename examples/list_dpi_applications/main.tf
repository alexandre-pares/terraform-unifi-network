module "dpi_applications" {
  source = "../../modules/dpi_applications"

  query_parameters = {
    limit  = 50
    offset = 0
    filter = "name.like('*Apple*')"
  }
}
