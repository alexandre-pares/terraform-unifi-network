# Firewall Zones Terraform Module

This module list Firewall Zones managed by your Unifi Network application.

## Examples

- [List Firewall Zones](../../examples/list_firewall_zones)

## Limitations

- `offset` not supported
- `limit` not supported
- `filter` not supported

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
| [restful_resource.firewall_zones](https://registry.terraform.io/providers/magodo/restful/latest/docs/data-sources/resource) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_query_parameters"></a> [query\_parameters](#input\_query\_parameters) | ## Description<br/><br/>  Query parameters to be sent with the API request.<br/><br/>  ## Example<pre>hcl<br/>  {<br/>    offset = 10<br/>    limit  = 20<br/>    filter = "metadata.origin.eq('SYSTEM_DEFINED')"<br/>  }</pre> | <pre>object({<br/>    offset = optional(number)<br/>    limit  = optional(number)<br/>    filter = optional(string)<br/>  })</pre> | `{}` | no |
| <a name="input_site_id"></a> [site\_id](#input\_site\_id) | ## Description<br/><br/>  Unifi site Id.<br/><br/>  ## Example<br/><br/>  `4c2d331d-6cdc-39d5-ae48-7457ff007b02`<br/><br/>  ## How to get the site Id<br/><br/>  You can use the `sites` sub-module to get the site id. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_firewall_zones"></a> [firewall\_zones](#output\_firewall\_zones) | ## Description<br/><br/>  List of Firewall Zones managed by the Unifi Network Application.<br/><br/>  ## Learn more<br/><br/>  https://developer.ui.com/network/v10.1.68/getfirewallzones<br/><br/>  ## Example<pre>hcl<br/>  {<br/>    count      = 6<br/>    data       = [<br/>      {<br/>        id         = "b62cfbb1-0595-4305-b169-5096a02c32f0"<br/>        metadata   = {<br/>          configurable = false<br/>          origin       = "SYSTEM_DEFINED"<br/>        }<br/>        name       = "Vpn"<br/>        networkIds = [<br/>          "4364c229-e599-419c-9ff6-ca3f71d9b227",<br/>          "a3e23929-73fd-419c-9189-1cd0383d6e15",<br/>          "8e6c2a8c-4d97-43cf-8c52-069fe6ab97a3",<br/>          "03cef337-1c71-450b-a3a6-fd8dd21375a7",<br/>        ]<br/>      },<br/>      {<br/>        id         = "04cce127-8b32-4923-acdc-d756e1fdf477"<br/>        metadata   = {<br/>          configurable = false<br/>          origin       = "SYSTEM_DEFINED"<br/>        }<br/>        name       = "Gateway"<br/>        networkIds = []<br/>      },<br/>      {<br/>        id         = "9659342e-e499-464e-81c6-59e591c64759"<br/>        metadata   = {<br/>          configurable = true<br/>          origin       = "SYSTEM_DEFINED"<br/>        }<br/>        name       = "Dmz"<br/>        networkIds = []<br/>      },<br/>      {<br/>        id         = "b53d9fba-9935-4889-96a9-f51a23b9470d"<br/>        metadata   = {<br/>          configurable = false<br/>          origin       = "SYSTEM_DEFINED"<br/>        }<br/>        name       = "External"<br/>        networkIds = [<br/>          "249f6197-5348-49bb-be23-7f7e02155fe5",<br/>          "351fc490-33f5-4ead-b243-c49318755243",<br/>        ]<br/>      },<br/>      {<br/>        id         = "854c48aa-687c-4520-b0c6-2d4dd324a0ec"<br/>        metadata   = {<br/>          configurable = true<br/>          origin       = "SYSTEM_DEFINED"<br/>        }<br/>        name       = "Internal"<br/>        networkIds = [<br/>          "0ea04911-db4e-4365-81df-0bfd0afe55e8",<br/>          "fa352a51-4acd-4b3c-aa18-a6e605aa256d",<br/>          "10f1fbdd-3b22-4f41-9c9c-850693199bf1",<br/>          "4e40e3c3-3d7d-49a3-8b81-544c3250450b",<br/>          "1867e15d-bb79-4475-a223-dace9967dd0c",<br/>          "9d7a459b-c265-444e-8629-ca681cd75fbf",<br/>          "dc49f925-9a7c-413e-991e-c34e1af27cae",<br/>        ]<br/>      },<br/>      {<br/>        id         = "364c92e1-c819-4d07-a402-221903cb4a94"<br/>        metadata   = {<br/>          configurable = true<br/>          origin       = "SYSTEM_DEFINED"<br/>        }<br/>        name       = "Hotspot"<br/>        networkIds = [<br/>          "f9bf0405-04f8-4076-8594-5a38e80065c4",<br/>        ]<br/>      },<br/>    ]<br/>    limit      = 25<br/>    offset     = 0<br/>    totalCount = 6<br/>  }</pre> |
<!-- END_TF_DOCS -->
