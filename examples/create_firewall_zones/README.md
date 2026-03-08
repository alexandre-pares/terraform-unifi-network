# Example: Create Networks

Create multiple networks in a Unifi site.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.14 |
| <a name="requirement_restful"></a> [restful](#requirement\_restful) | ~> 0.25 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_firewall_zone"></a> [firewall\_zone](#module\_firewall\_zone) | ../../modules/firewall_zone | n/a |
| <a name="module_sites"></a> [sites](#module\_sites) | ../../modules/sites | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_key"></a> [api\_key](#input\_api\_key) | ## Description<br/><br/>  Unifi Network API Key.<br/>  Please note that API key generated from the Unifi Site Manager can only be used on the remote API endpoint<br/>  and API key generated from the location Unifi Console can only be used on the local API endpoint.<br/><br/>  ## Create an Remote API Key<br/><br/>  To create a remote API key follow the instructions below:<br/>  1. Login to your Unifi Site Manager<br/>  2. Navigate to Settings > API Keys<br/>  3. (Optional) If you have multiples Fabrics (Previously called Organizations), select the desired Fabric from the dropdown or select "Independent Sites"<br/>  4. Click on "Create New API Key"<br/>  5. Provide a name (e.g. `tf-unifi-network`) and check "Unifi Applications"<br/>  6. Under "Expiration", select the desired expiration (e.g. `1 Month`)<br/>  7. Under Applications, select "Network"<br/>  8. (Optional) Under "Sites", select specific sites or leave it to "All"<br/>  9. Click on "Create" and copy the generated API Key<br/><br/>  ## Create a Local API Key<br/>  To create a local API key follow the instructions below:<br/>  1. Login to your Unifi Console using the local IP<br/>  2. Navigate to Integrations<br/>  3. Click on "Create New API Key"<br/>  4. Provide a name (e.g. `tf-local-unifi-network`)<br/>  5. (Optional) Provide a description<br/>  6. Under "Expiration", select the desired expiration (e.g. `1 Month`)<br/>  7. Click on "Create" and copy the generated API Key<br/><br/>  ## Security Note<br/><br/>  Never share your API key publicly (or commit it to GitHub). | `string` | n/a | yes |
| <a name="input_console_id"></a> [console\_id](#input\_console\_id) | ## Description<br/><br/>  Unifi Console ID.<br/><br/>  This is only required if `var.endpoint_type` is  `remote`.<br/><br/>  ## Example<br/><br/>  `<br/><br/>` | `string` | `""` | no |
| <a name="input_console_ip"></a> [console\_ip](#input\_console\_ip) | ## Description<br/><br/>  (local) IP Address of your Unifi Console.<br/>  This is only required if `var.endpoint_type` is `local`.<br/><br/>  ## Example<br/><br/>  `192.168.0.1` | `string` | `""` | no |
| <a name="input_endpoint_type"></a> [endpoint\_type](#input\_endpoint\_type) | ## Description<br/><br/>  Type of endpoint to use for API requests to your Unifi Console.<br/><br/>  Available options are:<br/><br/>  - `remote`: Use the Unifi API as a proxy to connect to your Unifi Console. This is the preferred method if you don't have a direct connection to your Unifi Console.<br/>  - `local`: Use a direct connection to your Unifi Console. This is the preferred method if you have a direct connection to your Unifi Console.<br/><br/>  ## Example<br/><br/>  `remote`<br/>  `local` | `string` | `"remote"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_firewall_zone_details"></a> [firewall\_zone\_details](#output\_firewall\_zone\_details) | ## Description<br/><br/>  Map of Firewall Zone details.<br/><br/>  ## Learn more<br/><br/>  https://developer.ui.com/network/v10.1.84/getfirewallzonedetails<br/><br/>  ## Example<pre>hcl<br/>  {<br/>    fwz_hotspot_custom.yaml = {<br/>      id = "857f712f-2f81-44a0-a16b-c4d00a9d8199"<br/>      metadata = {<br/>        origin = "USER_DEFINED"<br/>      }<br/>      name = "Hotspot_custom"<br/>      networkIds = []<br/>    }<br/>    fwz_internal_custom.yaml = {<br/>      id = "c0ee79a3-b05d-4133-8ad9-fa87b35c4eee"<br/>      metadata = {<br/>        origin = "USER_DEFINED"<br/>      }<br/>      name = "Internal_custom"<br/>      networkIds = []<br/>    }<br/>    vpn_custom = {<br/>      id = "bd172af0-0fdf-426c-a89c-42d438a572d4"<br/>      metadata = {<br/>        origin = "USER_DEFINED"<br/>      }<br/>      name = "Vpn_custom"<br/>      networkIds = []<br/>    }<br/>  }</pre> |
<!-- END_TF_DOCS -->
