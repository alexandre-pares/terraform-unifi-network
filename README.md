# terraform-unifi-network

Terraform Module for Unifi Network, compatible with Unifi Network API v10.1.68 and greater.

This module (and sub-modules) are based on the official Unifi Documentation:

- https://unifi.ui.com/settings/api-docs
- https://192.168.1.1/unifi-api/network (Assuming 192.168.1.1 is your Unifi Console IP)

## Usage

Checkout the [examples](./examples) folder for detailed examples.

## Features

This module catalogue tries to cover the Unifi endpoints as much as possible.

| **Endpoint**     	| **Feature**                          	    | **Support** 	|
|------------------	|-------------------------------------------|:-------------:|
| N/A             	| Get Generic API endpoint             	    |      ✅       |
| Application Info 	| Get Application Info                 	    |      ✅       |
| Sites            	| List Local Sites                     	    |  ⚠️ Partial  	|
| Unifi Devices    	| List Adopted Devices                 	    |  ⚠️ Partial  	|
| Unifi Devices    	| Adopt Devices                        	    |❌ Not working |
| Unifi Devices    	| Execute Port Action                  	    |      ❌       |
| Unifi Devices    	| Execute Adopted Device Action        	    |      ❌       |
| Unifi Devices    	| Get Adopted Device Details           	    |      ✅       |
| Unifi Devices    	| Get Latest Adopted Device Statistics 	    |      ✅       |
| Unifi Devices    	| List Devices Pending Adoption        	    |      ❌       |
| Clients          	| Execute Client Action                	    |      ❌       |
| Clients          	| List Connected Clients               	    |      ❌       |
| Clients          	| Get Connected Client Details         	    |      ❌       |
| Networks         	| Get Network Details                  	    |      ✅       |
| Networks         	| Update Network                       	    |      ✅       |
| Networks         	| Delete Network                       	    |      ✅       |
| Networks         	| List Networks                        	    |      ✅       |
| Networks         	| Create Network                       	    | ⚠️ Partial    |
| Networks         	| Get Network References               	    |      ❌       |
| Wifi Broadcasts   | Get Wifi Broadcast Details                |      ❌       |
| Wifi Broadcasts   | Update Wifi Broadcast                     |      ❌       |
| Wifi Broadcasts   | Delete Wifi Broadcast                     |      ❌       |
| Wifi Broadcasts   | List Wifi Broadcast                       |      ❌       |
| Wifi Broadcasts   | Create Wifi Broadcast                     |      ❌       |
| Hotspot           | List Vouchers                             |      ❌       |
| Hotspot           | Generate Vouchers                         |      ❌       |
| Hotspot           | Delete Vouchers                           |      ❌       |
| Hotspot           | Get Voucher Details                       |      ❌       |
| Hotspot           | Delete Voucher                            |      ❌       |
| Firewall          | Get Firewall Zone                         |      ❌       |
| Firewall          | Update Firewall Zone                      |      ❌       |
| Firewall          | Delete Cutom Firewall Zone                |      ❌       |
| Firewall          | Get Firewall Policy                       |      ❌       |
| Firewall          | Update Firewall Policy                    |      ❌       |
| Firewall          | Delete Firewall Policy                    |      ❌       |
| Firewall          | Patch Firewall Policy                     |      ❌       |
| Firewall          | Get User-Defined Firewall Policy Ordering |      ❌       |
| Firewall          | Reorder User-Defined Firewall Policies    |      ❌       |
| Firewall          | List Firewall Zones                       |      ✅       |
| Firewall          | Create Custom Firewall Zone               |      ❌       |
| Firewall          | List Firewall Policies                    |      ❌       |
| Firewall          | Create Firewall Policy                    |      ❌       |


The first row "Get Generic API endpoint" reference the [`./modules/generic_get_client`](./modules/generic_get_client) submodule and can be used to query (Get only) any Unifi Network API endpoint that is not yet implemented in this module.

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


### i/o timeout

```bash
╷
│ Error: Error to call Read
│
│   with module.sites.data.restful_resource.sites,
│   on ../../modules/sites/main.tf line 1, in data "restful_resource" "sites":
│    1: data "restful_resource" "sites" {
│
│ Get "https://192.168.1.1/proxy/network/integration/v1/sites": dial tcp 192.168.1.1:443: i/o timeout
╵
```

This can happen when using WSL2 on Windows after a long day of development. Simply restart your linux distro to fix it.


## Disclaimer

This module is not an official module from Ubiquiti Inc.

I only have access to limited Unifi hardware so not all endpoints can be implemented or tested.

I'm learning Terraform and will try to improve the modules over time. (I'm looking over `terraform query`, `terraform test` and maybe one time on a terraform provider).

## Inspiration

- [terraform-ibm-modules/common-dev-assets](https://github.com/terraform-ibm-modules/common-dev-assets/blob/main/module-assets/.pre-commit-config.yaml) for pre-commits
- [Azure/terraform-azurerm-avm-template](https://github.com/Azure/terraform-azurerm-avm-template/blob/main/outputs.tf) for TF variables and outputs descriptions format
- [Azure/terraform-azurerm-lz-vending](https://github.com/Azure/terraform-azurerm-lz-vending/blob/ddc6b5989a01e658250b998285c8dccb7b3afa30/docs/wiki/Example-3-YAML-data-files.md?plain=1#L31)


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
