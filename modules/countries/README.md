# Countries Terraform Module

This module list ISO-standard country codes and names, used for region-based configuration or regulatory compliance..

## Examples

- [List Countries](../../examples/list_countries)

## Limitations

N/A

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.14 |
| <a name="requirement_restful"></a> [restful](#requirement\_restful) | ~> 0.25 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_restful"></a> [restful](#provider\_restful) | ~> 0.25 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [restful_resource.countries](https://registry.terraform.io/providers/magodo/restful/latest/docs/data-sources/resource) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_query_parameters"></a> [query\_parameters](#input\_query\_parameters) | ## Description<br/><br/>  Query parameters to be sent with the API request.<br/><br/>  ## Example<pre>hcl<br/>  {<br/>    offset = 10<br/>    limit  = 20<br/>    filter = "name.like('Sw*')"<br/>  }</pre> | <pre>object({<br/>    offset = optional(number)<br/>    limit  = optional(number)<br/>    filter = optional(string)<br/>  })</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_countries"></a> [countries](#output\_countries) | ## Description<br/><br/>  List of  ISO-standard country codes and names, used for region-based configuration or regulatory compliance.<br/><br/>  ## Learn more<br/><br/>  https://developer.ui.com/network/v10.1.84/getcountries<br/><br/>  ## Example<pre>hcl<br/>  {<br/>    "count" = 25<br/>    "data" = [<br/>      {<br/>        "code" = "AD"<br/>        "name" = "Andorra"<br/>      },<br/>      {<br/>        "code" = "AE"<br/>        "name" = "United Arab Emirates"<br/>      },<br/>      {<br/>        "code" = "AF"<br/>        "name" = "Afghanistan"<br/>      },<br/>      {<br/>        "code" = "AG"<br/>        "name" = "Antigua and Barbuda"<br/>      },<br/>      {<br/>        "code" = "AI"<br/>        "name" = "Anguilla"<br/>      },<br/>      {<br/>        "code" = "AL"<br/>        "name" = "Albania"<br/>      },<br/>      {<br/>        "code" = "AM"<br/>        "name" = "Armenia"<br/>      },<br/>      {<br/>        "code" = "AO"<br/>        "name" = "Angola"<br/>      },<br/>      {<br/>        "code" = "AQ"<br/>        "name" = "Antarctica"<br/>      },<br/>      {<br/>        "code" = "AR"<br/>        "name" = "Argentina"<br/>      },<br/>      {<br/>        "code" = "AS"<br/>        "name" = "American Samoa"<br/>      },<br/>      {<br/>        "code" = "AT"<br/>        "name" = "Austria"<br/>      },<br/>      {<br/>        "code" = "AU"<br/>        "name" = "Australia"<br/>      },<br/>      {<br/>        "code" = "AW"<br/>        "name" = "Aruba"<br/>      },<br/>      {<br/>        "code" = "AX"<br/>        "name" = "Åland Islands"<br/>      },<br/>      {<br/>        "code" = "AZ"<br/>        "name" = "Azerbaijan"<br/>      },<br/>      {<br/>        "code" = "BA"<br/>        "name" = "Bosnia and Herzegovina"<br/>      },<br/>      {<br/>        "code" = "BB"<br/>        "name" = "Barbados"<br/>      },<br/>      {<br/>        "code" = "BD"<br/>        "name" = "Bangladesh"<br/>      },<br/>      {<br/>        "code" = "BE"<br/>        "name" = "Belgium"<br/>      },<br/>      {<br/>        "code" = "BF"<br/>        "name" = "Burkina Faso"<br/>      },<br/>      {<br/>        "code" = "BG"<br/>        "name" = "Bulgaria"<br/>      },<br/>      {<br/>        "code" = "BH"<br/>        "name" = "Bahrain"<br/>      },<br/>      {<br/>        "code" = "BI"<br/>        "name" = "Burundi"<br/>      },<br/>      {<br/>        "code" = "BJ"<br/>        "name" = "Benin"<br/>      },<br/>    ]<br/>    "limit" = 25<br/>    "offset" = 0<br/>    "totalCount" = 248<br/>  }</pre> |
<!-- END_TF_DOCS -->
