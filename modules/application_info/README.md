# Application Info Terraform Module

This module is used to retrieve informations about your Unifi Network application.

## Examples

- [Get Application Info](../../examples/get_application_info)

## Limitations

N/A

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.13 |
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
| [restful_resource.application_info](https://registry.terraform.io/providers/magodo/restful/latest/docs/data-sources/resource) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_application_info"></a> [application\_info](#output\_application\_info) | ## Description<br/><br/>  Unifi Application Information.<br/><br/>  ## Learn more<br/><br/>  https://developer.ui.com/network/v10.1.68/getinfo<br/><br/>  ## Example<pre>hcl<br/>  {<br/>    "applicationVersion" = "10.1.68"<br/>  }</pre> |
<!-- END_TF_DOCS -->
