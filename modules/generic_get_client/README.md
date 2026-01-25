# Generic Unifi Get API Client Terraform Module

This module can be used to get details about anything that is exposed through the Unifi Network API.

This is a data module.

## Examples

- [Get Network Details (Generic)](../../examples/generic_get_network_details)

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
| [restful_resource.generic_get_client](https://registry.terraform.io/providers/magodo/restful/latest/docs/data-sources/resource) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_path"></a> [path](#input\_path) | ## Description<br/><br/>  API endpoint path.<br/><br/>  ## Example<br/><br/>  `/v1/sites/5f7d3a2e4c6b3a00123abcd4/networks/1a25e9d4-8864-49d5-abc4-fffc47905326/references`<br/><br/>  ## How to get API endpoint path<br/><br/>  Navigate the Official Unifi Network API documentation and search for the correspondig endpoint path.<br/><br/>  - https://unifi.ui.com/settings/api-docs<br/>  - https://192.168.1.1/unifi-api/network (Assuming 192.168.1.1 is your Unifi Console IP) | `string` | n/a | yes |
| <a name="input_query_parameters"></a> [query\_parameters](#input\_query\_parameters) | ## Description<br/><br/>  Query parameters to be sent with the API request.<br/><br/>  ## Example<pre>hcl<br/>  {<br/>    offset = 10<br/>    limit  = 20<br/>    filter = "metadata.origin.eq('SYSTEM_DEFINED')"<br/>  }</pre> | `map(string)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_response"></a> [response](#output\_response) | ## Description<br/><br/>  API response<br/><br/>  ## Example<br/><br/><br/>  ### Network Details response<pre>hcl<br/>  {<br/>    cellularBackupEnabled = false<br/>    default               = true<br/>    enabled               = true<br/>    id                    = "1a25e9d4-8864-49d5-abc4-fffc47905326"<br/>    internetAccessEnabled = true<br/>    ipv4Configuration     = {<br/>      autoScaleEnabled  = true<br/>      dhcpConfiguration = {<br/>          domainName                   = "local-domain.tld"<br/>          ipAddressRange               = {<br/>              start = "192.168.1.6"<br/>              stop  = "192.168.1.254"<br/>            }<br/>          leaseTimeSeconds             = 86400<br/>          mode                         = "SERVER"<br/>          pingConflictDetectionEnabled = true<br/>        }<br/>      hostIpAddress     = "192.168.1.1"<br/>      prefixLength      = 24<br/>    }<br/>  ipv6Configuration     = {<br/>    clientAddressAssignment        = {<br/>      slaacEnabled = true<br/>    }<br/>    interfaceType                  = "PREFIX_DELEGATION"<br/>    prefixDelegationWanInterfaceId = "d7a6a629-5696-4140-ae5f-50a29bc04061"<br/>    routerAdvertisement            = {<br/>      priority = "HIGH"<br/>    }<br/>    }<br/>    isolationEnabled      = false<br/>    management            = "GATEWAY"<br/>    mdnsForwardingEnabled = true<br/>    metadata              = {<br/>      configurable = true<br/>      origin       = "SYSTEM_DEFINED"<br/>    }<br/>    name                  = "Default"<br/>    vlanId                = 1<br/>    zoneId                = "b54d3153-7f14-4aaf-9ceb-95a5a08d5519"<br/>  }</pre>### List networks response<pre>hcl<br/>  {<br/>    offset      = 0,<br/>    limit       = 0,<br/>    count       = 1,<br/>    totalCount  = 1,<br/>    data        = [<br/>      {<br/>        default    = true<br/>        enabled    = true<br/>        id         = "1a25e9d4-8864-49d5-abc4-fffc47905326"<br/>        management = "GATEWAY"<br/>        metadata   = {<br/>            configurable = true<br/>            origin       = "SYSTEM_DEFINED"<br/>        }<br/>        name       = "Default"<br/>        vlanId     = 1<br/>        zoneId     = "b54d3153-7f14-4aaf-9ceb-95a5a08d5519"<br/>      }<br/>    ]<br/>  }</pre> |
<!-- END_TF_DOCS -->
