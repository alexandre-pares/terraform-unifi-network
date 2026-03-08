# Network References Terraform Module

This module retrieve references to a specific network managed by your Unifi Network application.

## Examples

- [Get Network References](../../examples/get_network_references)

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
| [restful_resource.network_references](https://registry.terraform.io/providers/magodo/restful/latest/docs/data-sources/resource) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_network_id"></a> [network\_id](#input\_network\_id) | ## Description<br/><br/>  Network Id.<br/><br/>  ## Example<br/><br/>  `1a25e9d4-8864-49d5-abc4-fffc47905326`<br/><br/>  ## How to get the network Id<br/><br/>  You can use the `networks` sub-module to get the network id. | `string` | n/a | yes |
| <a name="input_query_parameters"></a> [query\_parameters](#input\_query\_parameters) | ## Description<br/><br/>  Query parameters to be sent with the API request.<br/><br/>  ## Example<pre>hcl<br/>  {<br/>    offset = 10<br/>    limit  = 20<br/>    filter = "metadata.origin.eq('USER_DEFINED')"<br/>  }</pre> | <pre>object({<br/>    offset = optional(number)<br/>    limit  = optional(number)<br/>    filter = optional(string)<br/>  })</pre> | `{}` | no |
| <a name="input_site_id"></a> [site\_id](#input\_site\_id) | ## Description<br/><br/>  Unifi site Id.<br/><br/>  ## Example<br/><br/>  `4c2d331d-6cdc-39d5-ae48-7457ff007b02`<br/><br/>  ## How to get the site Id<br/><br/>  You can use the `sites` sub-module to get the site id. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_references"></a> [network\_references](#output\_network\_references) | ## Description<br/><br/>  References to a specific network.<br/><br/>  ## Learn more<br/><br/>  https://developer.ui.com/network/v10.1.84/getnetworkreferences<br/><br/>  ## Example<pre>hcl<br/>  {<br/>    referenceResources = [<br/>      {<br/>        referenceCount = 3<br/>        references     = [<br/>            {<br/>              referenceId = "7468ddd6-4563-47b8-a146-1c7f097f1765"<br/>            },<br/>            {<br/>              referenceId = "b1a91738-4008-4bf6-b93f-24d0c0f7f0f1"<br/>            },<br/>            {<br/>              referenceId = "604a2754-8afe-4ae9-873a-22be1dd48043"<br/>            },<br/>          ]<br/>        resourceType   = "WIFI"<br/>      },<br/>      {<br/>        referenceCount = 1<br/>        resourceType   = "OSPF_ROUTE"<br/>      },<br/>    ]<br/>  }</pre> |
<!-- END_TF_DOCS -->
