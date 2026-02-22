module "countries" {
  source = "../../modules/countries"

  query_parameters = {
    limit  = 50
    offset = 0
    filter = "name.like('Sw*')"
  }
}
