# terraform-unifi-network

Terraform Module for Unifi Network, compatible with Unifi Network API v10.1.68 and greater.

This module (and sub-modules) are based on the official Unifi Documentation:

- https://unifi.ui.com/settings/api-docs
- https://192.168.1.1/unifi-api/network (Assuming 192.168.1.1 is your Unifi Console IP)

## Usage

Checkout the [examples](./examples) folder for detailed examples.

## Features

This module catalogue tries to cover the Unifi endpoints as much as possible.

| **Endpoint**     	         | **Feature**                          	   | **Support** 	 |
|----------------------------|-------------------------------------------|:-------------:|
| N/A             	         | Get Generic API endpoint             	   |      ✅       |
| Application Info 	         | Get Application Info                 	   |      ✅       |
| Sites            	         | List Local Sites                     	   |  ⚠️ Partial   |
| Unifi Devices    	         | List Adopted Devices                 	   |  ⚠️ Partial   |
| Unifi Devices    	         | Adopt Devices                        	   |❌ Not working |
| Unifi Devices    	         | Execute Port Action                  	   |      ❌       |
| Unifi Devices    	         | Execute Adopted Device Action        	   |      ❌       |
| Unifi Devices    	         | Get Adopted Device Details           	   |      ✅       |
| Unifi Devices    	         | Get Latest Adopted Device Statistics 	   |      ✅       |
| Unifi Devices    	         | List Devices Pending Adoption        	   |      ✅       |
| Clients          	         | Execute Client Action                	   |      ❌       |
| Clients          	         | List Connected Clients               	   |      ❌       |
| Clients          	         | Get Connected Client Details         	   |      ❌       |
| Networks         	         | Get Network Details                  	   |      ✅       |
| Networks         	         | Update Network                       	   |      ✅       |
| Networks         	         | Delete Network                       	   |      ✅       |
| Networks         	         | List Networks                        	   |      ✅       |
| Networks         	         | Create Network                       	   | ⚠️ Partial    |
| Networks         	         | Get Network References               	   |      ❌       |
| Wifi Broadcasts            | Get Wifi Broadcast Details                |      ❌       |
| Wifi Broadcasts            | Update Wifi Broadcast                     |      ❌       |
| Wifi Broadcasts            | Delete Wifi Broadcast                     |      ❌       |
| Wifi Broadcasts            | List Wifi Broadcast                       |      ❌       |
| Wifi Broadcasts            | Create Wifi Broadcast                     |      ❌       |
| Hotspot                    | List Vouchers                             |      ❌       |
| Hotspot                    | Generate Vouchers                         |      ❌       |
| Hotspot                    | Delete Vouchers                           |      ❌       |
| Hotspot                    | Get Voucher Details                       |      ❌       |
| Hotspot                    | Delete Voucher                            |      ❌       |
| Firewall                   | Get Firewall Zone                         |      ✅       |
| Firewall                   | Update Firewall Zone                      |      ✅       |
| Firewall                   | Delete Cutom Firewall Zone                |      ✅       |
| Firewall                   | Get Firewall Policy                       |      ❌       |
| Firewall                   | Update Firewall Policy                    |      ❌       |
| Firewall                   | Delete Firewall Policy                    |      ❌       |
| Firewall                   | Patch Firewall Policy                     |      ❌       |
| Firewall                   | Get User-Defined Firewall Policy Ordering |      ❌       |
| Firewall                   | Reorder User-Defined Firewall Policies    |      ❌       |
| Firewall                   | List Firewall Zones                       |      ✅       |
| Firewall                   | Create Custom Firewall Zone               |      ✅       |
| Firewall                   | List Firewall Policies                    |      ❌       |
| Firewall                   | Create Firewall Policy                    |      ❌       |
| Access Control (ACL Rules) | Get ACL Rule                              |      ❌       |
| Access Control (ACL Rules) | Update ACL Rule                           |      ❌       |
| Access Control (ACL Rules) | Delete ACL Rule                           |      ❌       |
| Access Control (ACL Rules) | Get User-Defined ACL Rule Ordering        |      ❌       |
| Access Control (ACL Rules) | Reorder User-Defined ACL Rules            |      ❌       |
| Access Control (ACL Rules) | List ACL Rules                            |      ❌       |
| Access Control (ACL Rules) | Create ACL Rule                           |      ❌       |
| DNS Policies               | Get DNS Policy                            |      ❌       |
| DNS Policies               | Update DNS Policy                         |      ❌       |
| DNS Policies               | Delete DNS Policy                         |      ❌       |
| DNS Policies               | List DNS Policies                         |      ❌       |
| DNS Policies               | Create DNS Policy                         |      ❌       |
| Traffic Matching Lists     | Get Traffic Matching List                 |      ❌       |
| Traffic Matching Lists     | Update Traffic Matching List              |      ❌       |
| Traffic Matching Lists     | Delete Traffic Matching List              |      ❌       |
| Traffic Matching Lists     | List Traffic Matching Lists               |      ❌       |
| Traffic Matching Lists     | Create Traffic Matching List              |      ❌       |
| Supporting Resources       | List WAN interfaces                       |      ✅       |
| Supporting Resources       | List Site-to-Site VPN Tunnels             |      ✅       |
| Supporting Resources       | List VPN Servers                          |      ✅       |
| Supporting Resources       | List Radius Profiles                      |      ✅       |
| Supporting Resources       | List Device Tags                          |      ✅       |
| Supporting Resources       | List DPI Application Categories           |      ✅       |
| Supporting Resources       | List DPI Applications                     |      ✅       |
| Supporting Resources       | List Countries                            |      ✅       |

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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_application_info"></a> [application\_info](#module\_application\_info) | ./modules/application_info | n/a |
| <a name="module_firewall_zone"></a> [firewall\_zone](#module\_firewall\_zone) | ./modules/firewall_zone | n/a |
| <a name="module_network"></a> [network](#module\_network) | ./modules/network | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_firewall_zones"></a> [firewall\_zones](#input\_firewall\_zones) | (Optional) A map of firewall zones to create<br/><br/>  - `name` - Name of the firewall zone<br/>  - `network_ids` - (Optional) List of network id to attach to this firewall zone. | <pre>map(object({<br/>    name        = string<br/>    network_ids = optional(list(string))<br/>  }))</pre> | `{}` | no |
| <a name="input_networks"></a> [networks](#input\_networks) | (Optional) A map of networks to create<br/><br/>  - `management_type` - Type of management.<br/>  - `name` - Name of the network.<br/>  - `enabled` - (Optional) Whether the network is enabled.<br/>  - `vlan_id` - VLAN ID of the network.<br/>  - `enable_isolation` - (Optional) Whether this network is isolated from all other networks.<br/>  - `enable_cellular_backup` - (Optional) Whether this network is allowed to use cellular data when WAN connection(s) are down.<br/>  - `firewall_zone_id` - (Optional) Firewall zone ID associated with this Network.<br/>  - `enable_internet_access` - (Optional) Whether the internet access is allowed for the device on this network.<br/>  - `enable_mdns_forwarding` - (Optional) Whether this network should participate in mDNS traffic forwarding.<br/><br/>  ---<br/>  `dhcp_guarding` supports the following:<br/>  - `trusted_dhcp_server_ip_addresses` - (Optional) List of trusted DHCP server IP addresses.<br/><br/>  ---<br/>  `ipv4_configuration` - IPv4 Configuration - supports the following:<br/>  - `enable_auto_scale` - Whether the Network can automatically scale its subnet size based on the number of active DHCP leases.<br/>  - `host_ip_address` - Address of the host network<br/>  - `prefix_length` - CIDR of the network<br/>  - `additional_host_ip_subnets` - (Optional) Additional host IP subnets assigned to this VLAN.<br/>  - `dhcp_configuration` - IPv4 DHCP configuration for this network - supports the following:<br/>    - `mode` - SERVER or RELAY<br/>    - `ip_address_range` - Start and end IP range - supports the following:<br/>      - `start` - Start of IP range<br/>      - `stop` - End of IP range<br/>    - `override_gateway_ip_address` - (Optional) Gateway IP address provided to DHCP clients.<br/>    - `override_dns_server_ip_addresses` - (Optional) List of DNS servers assigned to client devices by the DHCP server.<br/>    - `lease_time_seconds` - (Optional) The lease time in seconds for addresses in this range.<br/>    - `domain_name` - (Optional) Domain name that can be used to access network in the browser.<br/>    - `enable_ping_conflict_detection` - (Optional) Verify an IP address is unused by sending a ping before leasing it.<br/>    - `pxe_configuration` - Pre execution environment configuration for network boot - supports the following:<br/>      - `server_ip_address` - IP Address of the PXE server<br/>      - `filename` - Filename to fetch<br/>    - `ntp_server_ip_addresses` - (Optional) Network Time Protocol (NTP) server IP addresses.<br/>    - `option_43_value` - (Optional) Custom DHCP option (43)<br/>    - `tftp_server_address` - (Optional) Trivial File Transfer Protocol (TFTP) server address<br/>    - `time_offset_seconds` - (Optional) Time offset in seconds from UTC.<br/>    - `wpad_url` - (Optional) Web Proxy Auto-Discovery (WPAD) URL.<br/>    - `wins_server_ip_addresses` - (Optional) Windows Internet Name Service (WINS) server IP addresses.<br/>    - `dhcp_server_ip_addresses` - (Optional) DHCP Server IP addresses<br/>  - `nat_outbound_ip_address_configuration` - Array of object (WAN NAT Outbound Configuration) - supports the following:<br/>    - `type` - AUTO or STATIC<br/>    - `wan_interface_ip` - WAN Interface IP<br/>    - `ip_address_selection_mode` - (Optional) IP address selection mode which determines how the IP address will be selected from the group of IP addresses to translate the traffic on network using NAT.<br/>    - `ip_address_selectors` - List of IP addresses or address ranges which determines which IP addresses - supports the following:<br/>      - `type` - IP\_ADDRESS or IP\_ADDRESS\_RANGE<br/>      - `value` - (Optional)<br/>      - `start` - (Optional)<br/>      - `stop` - (Optional)<br/><br/>  ---<br/>  `ipv6_configuration` - IPv6 Configuration - supports the following:<br/>  - `interface_type` - IPv6 type to use<br/>  - `client_address_assignment` - Client Address Assignment - supports the following:<br/>    - `dhcp_configuration` - (Optional) DHCP Configuration - supports the following:<br/>      - `ip_address_suffix_range` supports the following:<br/>        - `start` - Start suffix of the DHCPv6 address pool.<br/>        - `stop` - End suffix of the DHCPv6 address pool.<br/>      - `lease_time_seconds` - The lease time in seconds for IP addresses in this range.<br/>    - `enable_slaac` - Allows devices to obtain IPv6 addresses via SLAAC (Stateless Address Autoconfiguration) without DHCPv6.<br/>  - `router_advertisement` - (Optional) Router advertisement (RA) supports the following:<br/>    - `priority` - Router advertisement priority.<br/>  - `override_dns_server_ip_addresses` - (Optional) The IPv6 DNS server addresses assigned to this Network.<br/>  - `additional_host_ip_subnets` - (Optional) Additional host IP subnets assigned to this VLAN.<br/>  - `host_ip_address` - (Optional) The static IPv6 address assigned to this Network.<br/>  - `prefix_length` - (Optional) CIDR<br/>  - `prefix_delegation_wan_interface_id` - (Optional) ID of the WAN interface from which the prefix is delegated. | <pre>map(object({<br/>    management_type = string<br/>    name            = string<br/>    enabled         = optional(bool)<br/>    vlan_id         = number<br/>    dhcp_guarding = optional(object({<br/>      trusted_dhcp_server_ip_addresses = optional(list(string))<br/>    }))<br/>    enable_isolation       = optional(bool)<br/>    enable_cellular_backup = optional(bool)<br/>    firewall_zone_id       = optional(string)<br/>    enable_internet_access = optional(bool)<br/>    enable_mdns_forwarding = optional(bool)<br/>    ipv4_configuration = optional(object({<br/>      # Whether the Network can automatically scale its subnet size based on the number of active DHCP leases.<br/>      enable_auto_scale = bool<br/><br/>      # Address of the host network<br/>      host_ip_address = string<br/><br/>      # CIDR of the network<br/>      prefix_length = number<br/><br/>      # Additional host IP subnets assigned to this VLAN.<br/>      additional_host_ip_subnets = optional(list(string))<br/><br/>      # IPv4 DHCP configuration for this network.<br/>      # If this field is omitted or null, DHCP is not working and hosts must get an address statically<br/>      # or from another server in this broadcast domain.<br/>      dhcp_configuration = optional(object({<br/>        # SERVER or RELAY<br/>        mode = string<br/><br/>        # Start and end IP range<br/>        # If null, the first and last IP addresses available in the IP range will be used<br/>        ip_address_range = optional(object({<br/>          start = string<br/>          stop  = string<br/>        }))<br/><br/>        # Gateway IP address provided to DHCP clients.<br/>        # If null, the default gateway will be assigned.<br/>        override_gateway_ip_address = optional(string)<br/><br/>        # List of DNS servers assigned to client devices by the DHCP server.<br/>        # If none are specified, they will be selected automatically.<br/>        override_dns_server_ip_addresses = optional(list(string))<br/><br/>        # The lease time in seconds for addresses in this range.<br/>        lease_time_seconds = optional(number)<br/><br/>        # Domain name that can be used to access network in the browser.<br/>        domain_name = optional(string)<br/><br/>        # Verify an IP address is unused by sending a ping before leasing it.<br/>        enable_ping_conflict_detection = optional(bool)<br/><br/>        # Pre execution environment configuration for network boot<br/>        pxe_configuration = optional(object({<br/>          # IP Address of the PXE server<br/>          server_ip_address = string<br/><br/>          # Filename to fetch<br/>          # Example: boot\x64\wdsnbp.com<br/>          filename = string<br/>        }))<br/><br/>        # Network Time Protocol (NTP) server IP addresses.<br/>        # Max 2 servers<br/>        # doesn't support domain, must be an IP<br/>        ntp_server_ip_addresses = optional(list(string))<br/><br/>        # Custom DHCP option (43)<br/>        # the value MUST be the UniFi Network application's host IP address.<br/>        option_43_value = optional(string)<br/><br/>        # Trivial File Transfer Protocol (TFTP) server address<br/>        # accepts a hostname, URL or IP address.<br/>        tftp_server_address = optional(string)<br/><br/>        # Time offset in seconds from UTC.<br/>        time_offset_seconds = optional(number)<br/><br/>        # Web Proxy Auto-Discovery (WPAD) URL.<br/>        wpad_url = optional(string)<br/><br/>        # Windows Internet Name Service (WINS) server IP addresses.<br/>        wins_server_ip_addresses = optional(list(string))<br/><br/>        # DHCP Server IP addresses<br/>        # Required if mode is RELAY, not required if mode is SERVER<br/>        dhcp_server_ip_addresses = optional(list(string))<br/>      }))<br/><br/>      # Array of object (WAN NAT Outbound Configuration)<br/>      nat_outbound_ip_address_configuration = optional(list(object({<br/>        # AUTO or STATIC<br/>        type = string<br/><br/>        # WAN interface IP<br/>        wan_interface_ip = string<br/><br/>        # IP address selection mode which determines how the IP address will be selected<br/>        # from the group of IP addresses to translate the traffic on network using NAT.<br/>        # Required if type is AUTO<br/>        ip_address_selection_mode = optional(string)<br/><br/>        # List of IP addresses or address ranges which determines which IP addresses<br/>        # will be used to translate the traffic on network using NAT.<br/>        ip_address_selectors = optional(set(object({<br/>          # IP_ADDRESS or IP_ADDRESS_RANGE<br/>          type  = string<br/>          value = optional(string)<br/>          start = optional(string)<br/>          stop  = optional(string)<br/>        })))<br/><br/>      })))<br/><br/>    }))<br/>    ipv6_configuration = optional(object({<br/>      # IPv6 type to use<br/>      # - PREFIX_DELEGATION<br/>      # - STATIC<br/>      interface_type = string<br/><br/>      # Client Address Assignment<br/>      client_address_assignment = object({<br/>        # DHCP Configuration<br/>        dhcp_configuration = optional(object({<br/>          ip_address_suffix_range = object({<br/>            # Start suffix of the DHCPv6 address pool.<br/>            start = string<br/>            # End suffix of the DHCPv6 address pool.<br/>            stop = string<br/>          })<br/>          # The lease time in seconds for IP addresses in this range.<br/>          lease_time_seconds = number<br/>        }))<br/><br/>        # SLAAC<br/>        # Allows devices to obtain IPv6 addresses via SLAAC (Stateless Address Autoconfiguration) without DHCPv6.<br/>        # At least one addressing method must be active: either enable SLAAC or provide DHCP configuration.<br/>        enable_slaac = bool<br/>      })<br/><br/>      # Router advertisement (RA).<br/>      # Without it, hosts will not autoconfigure addresses and will lack a default route even with DHCPv6.<br/>      router_advertisement = optional(object({<br/>        # Router advertisement priority.<br/>        # - LOW<br/>        # - MEDIUM<br/>        # - HIGH<br/>        priority = string<br/>      }))<br/><br/>      # The IPv6 DNS server addresses assigned to this Network.<br/>      # If none are specified, they will be selected automatically.<br/>      override_dns_server_ip_addresses = optional(list(string))<br/><br/>      # Additional host IP subnets assigned to this VLAN.<br/>      additional_host_ip_subnets = optional(list(string))<br/><br/>      # The static IPv6 address assigned to this Network.<br/>      host_ip_address = optional(string)<br/><br/>      # CIDR<br/>      prefix_length = optional(number)<br/><br/>      # ID of the WAN interface from which the prefix is delegated.<br/>      prefix_delegation_wan_interface_id = optional(string)<br/>    }))<br/>    device_id = optional(string)<br/>  }))</pre> | `{}` | no |
| <a name="input_site_id"></a> [site\_id](#input\_site\_id) | Unifi site Id. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_application_info"></a> [application\_info](#output\_application\_info) | ## Description<br/><br/>  Unifi Application Information.<br/><br/>  ## Learn more<br/><br/>  https://developer.ui.com/network/v10.1.68/getinfo<br/><br/>  ## Example<pre>hcl<br/>  {<br/>    "applicationVersion" = "10.1.68"<br/>  }</pre> |
| <a name="output_firewall_zones"></a> [firewall\_zones](#output\_firewall\_zones) | ## Description<br/><br/>  Map of Firewall Zone details.<br/><br/>  ## Learn more<br/><br/>  https://developer.ui.com/network/v10.1.84/getfirewallzonedetails<br/><br/>  ## Example<pre>hcl<br/>  {<br/>    fwz_hotspot_custom.yaml = {<br/>      id = "857f712f-2f81-44a0-a16b-c4d00a9d8199"<br/>      metadata = {<br/>        origin = "USER_DEFINED"<br/>      }<br/>      name = "Hotspot_custom"<br/>      networkIds = []<br/>    }<br/>    fwz_internal_custom.yaml = {<br/>      id = "c0ee79a3-b05d-4133-8ad9-fa87b35c4eee"<br/>      metadata = {<br/>        origin = "USER_DEFINED"<br/>      }<br/>      name = "Internal_custom"<br/>      networkIds = []<br/>    }<br/>    vpn_custom = {<br/>      id = "bd172af0-0fdf-426c-a89c-42d438a572d4"<br/>      metadata = {<br/>        origin = "USER_DEFINED"<br/>      }<br/>      name = "Vpn_custom"<br/>      networkIds = []<br/>    }<br/>  }</pre> |
| <a name="output_networks"></a> [networks](#output\_networks) | ## Description<br/><br/>  Map of created network details.<br/><br/>  ## Learn more<br/><br/>  https://developer.ui.com/network/v10.1.68/getnetworkdetails<br/><br/>  ## Example<pre>hcl<br/>  {<br/>    network_001 = {<br/>      cellularBackupEnabled = false<br/>      default               = true<br/>      enabled               = true<br/>      id                    = "1a25e9d4-8864-49d5-abc4-fffc47905326"<br/>      internetAccessEnabled = true<br/>      ipv4Configuration     = {<br/>        autoScaleEnabled  = true<br/>        dhcpConfiguration = {<br/>            domainName                   = "local-domain.tld"<br/>            ipAddressRange               = {<br/>                start = "192.168.1.6"<br/>                stop  = "192.168.1.254"<br/>              }<br/>            leaseTimeSeconds             = 86400<br/>            mode                         = "SERVER"<br/>            pingConflictDetectionEnabled = true<br/>          }<br/>        hostIpAddress     = "192.168.1.1"<br/>        prefixLength      = 24<br/>      }<br/>    ipv6Configuration     = {<br/>      clientAddressAssignment        = {<br/>        slaacEnabled = true<br/>      }<br/>      interfaceType                  = "PREFIX_DELEGATION"<br/>      prefixDelegationWanInterfaceId = "d7a6a629-5696-4140-ae5f-50a29bc04061"<br/>      routerAdvertisement            = {<br/>        priority = "HIGH"<br/>      }<br/>      }<br/>      isolationEnabled      = false<br/>      management            = "GATEWAY"<br/>      mdnsForwardingEnabled = true<br/>      metadata              = {<br/>        configurable = true<br/>        origin       = "SYSTEM_DEFINED"<br/>      }<br/>      name                  = "Default"<br/>      vlanId                = 1<br/>      zoneId                = "b54d3153-7f14-4aaf-9ceb-95a5a08d5519"<br/>    }<br/>  }</pre> |
<!-- END_TF_DOCS -->
