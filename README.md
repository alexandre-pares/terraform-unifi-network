# terraform-unifi-network

Terraform Module for Unifi Network, compatible with Unifi Network API v10.1.68 and greater.

This module (and sub-modules) are based on the official Unifi Documentation:
https://unifi.ui.com/settings/api-docs

## Usage

Checkout the [examples](./examples) folder for detailed examples.

## Features

This module catalogue tries to cover the Unifi endpoints as much as possible.

| **Endpoint**     	| **Feature**                          	| **Support** 	|
|------------------	|--------------------------------------	|:-------------:|
| Application Info 	| Get Application Info                 	|      ✅       |
| Sites            	| List Local Sites                     	|  ⚠️ Partial  	|
| Unifi Devices    	| List Adopted Devices                 	|  ⚠️ Partial  	|
| Unifi Devices    	| Adopt Devices                        	|❌ Not working |
| Unifi Devices    	| Execute Port Action                  	|      ❌       |
| Unifi Devices    	| Execute Adopted Device Action        	|      ❌       |
| Unifi Devices    	| Get Adopted Device Details           	|      ✅       |
| Unifi Devices    	| Get Latest Adopted Device Statistics 	|      ✅       |
| Unifi Devices    	| List Devices Pending Adoption        	|      ❌       |
| Clients          	| Execute Client Action                	|      ❌       |
| Clients          	| List Connected Clients               	|      ❌       |
| Clients          	| Get Connected Client Details         	|      ❌       |
| Networks         	| Get Network Details                  	|      ❌       |
| Networks         	| Update Network                       	|      ❌       |
| Networks         	| Delete Network                       	|      ❌       |
| Networks         	| List Networks                        	|      ❌       |
| Networks         	| Create Network                       	|      ❌       |
| Networks         	| Get Network References               	|      ❌       |

## Common Issues

### tls: failed to verify certificate

```bash
╷
│ Error: Error to call Read
│
│   with module.sites.data.restful_resource.sites,
│   on ..\..\modules\sites\main.tf line 1, in data "restful_resource" "sites":
│    1: data "restful_resource" "sites" {
│
│ Get "https://192.168.1.1/proxy/network/integration/v1/sites": tls: failed to verify certificate: x509: certificate signed by
│ unknown authority
╵
```

This can happen when you are using the `local` API endpoint because your Unifi Console uses by default a self-signed certificate (`e.g. CN=unifi.local`).

To fix this issue you can either:
- Verify that your `magodo/restful` provider has the `tls_insecure_skip_verify` parameter set to `true` when using a local endpoint (See [`./examples/get_application_info/terraform.tf`](./examples/get_application_info/terraform.tf#L24))
- Add a trusted certificate to your Unifi Console (Settings > Console Plane > Certificates > Add new)

## Disclaimer

This module is not an official module from Ubiquiti Inc.

I only have access to limited Unifi hardware so not all endpoints can be implemented or tested.

I'm learning Terraform and will try to improve the modules over time. (I'm looking over `terraform query`, `terraform test` and maybe one time on a terraform provider).

Contributions are welcome but any AI generated PR will be rejected.


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.14 |

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->
