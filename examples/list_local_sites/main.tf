module "sites" {
  source = "../../modules/sites"

  query_parameters = {
    limit  = 20
    offset = 0
    filter = "internalReference.eq('default')"
  }
}
