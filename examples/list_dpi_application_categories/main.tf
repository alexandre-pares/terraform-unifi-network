module "dpi_application_categories" {
  source = "../../modules/dpi_application_categories"

  query_parameters = {
    limit  = 20
    offset = 0
    filter = "name.like('*tools*')"
  }
}
