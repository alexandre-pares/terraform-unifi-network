variable "site_id" {
  description = <<DESCRIPTION
  ## Description

  Unifi site Id.

  ## Example

  `4c2d331d-6cdc-39d5-ae48-7457ff007b02`

  ## How to get the site Id

  You can use the `sites` sub-module to get the site id.

  DESCRIPTION

  type     = string
  nullable = false
}

variable "type" {
  description = <<DESCRIPTION
  ## Description

  Type of WiFi broadcast.
  Possible values are `STANDARD` and `IOT_OPTIMIZED`.

  ## Example

  - `STANDARD`
  - `IOT_OPTIMIZED`

  ## Default

  `STANDARD`

  DESCRIPTION

  type     = string
  nullable = false
  default  = "STANDARD"

  validation {
    condition     = contains(["STANDARD", "IOT_OPTIMIZED"], var.type)
    error_message = "The 'type' variable must be either 'STANDARD' or 'IOT_OPTIMIZED'."
  }
}

variable "name" {
  description = <<DESCRIPTION
  ## Description

  Name of the WiFi broadcast.

  ## Example

  `Guest WiFi`

  DESCRIPTION

  type     = string
  nullable = false
}

variable "network" {
  description = <<DESCRIPTION
  ## Description

  Network to attached the WiFi broadcast to.
  Possible type values are `NATIVE` or `SPECIFIC`.
  If `SPECIFIC` is used, the `network_id` key must be set.

  ## Example

  ```hcl
  {
    type = "SPECIFIC"
    network_id = "5a693e6b-c0a8-4485-8a69-6732a884f2a2"
  }
  ```

  ## Default

  ```hcl
  {
    type = "NATIVE"
  }
  ```

  DESCRIPTION

  type = object({
    type       = string
    network_id = optional(string)
  })
  nullable = true
  default  = null

  validation {
    condition     = var.network == null || contains(["NATIVE", "SPECIFIC"], var.network.type)
    error_message = "The 'network.type' variable must be either 'NATIVE' or 'SPECIFIC'."
  }
}

variable "enabled" {
  description = <<DESCRIPTION
  ## Description

  Whether the WiFi broadcast is enabled or not.

  ## Example

  `true`

  ## Default

  `true`

  DESCRIPTION

  type     = bool
  nullable = false
  default  = true
}

variable "security_configuration" {
  description = <<DESCRIPTION
  ## Description

  Security configuration of the WiFi broadcast.

  - `type` - Security type of the WiFi broadcast. Possible values are `OPEN`, `WPA2_PERSONAL`, `WPA3_PERSONAL`, `WPA2_WPA3_PERSONAL`, `WPA2_ENTERPRISE`, `WPA3_ENTERPRISE` and `WPA2_WPA3_ENTERPRISE`.
  - `group_rekey_interval_seconds` - Group rekey interval in seconds. Sets how often connected device groups are assigned a new key. If null, then it is disabled. This feature is not available for IoT configuration.
  - `enable_fast_roaming` - Fast roaming enabled flag. This feature is not available for IoT configuration or OPEN security. You will experience connectivity issues with devices that do not support the 802.11r WiFi standard.
  - `passphrase` - Passphrase. Required when type is `WPA2_PERSONAL`, `WPA3_PERSONAL` or `WPA2_WPA3_PERSONAL`
  - `pmf_mode` - Protected Management Frames mode. If null, then it is disabled. This feature is not available for IoT configuration.
  - `enable_wpa3_fast_roaming` - WPA3 fast roaming can be enabled only if the default fast roaming is enabled.
  - `enable_coa` - Indicates whether Change of Authorization (COA) is enabled.
  - `security_mode` - Security mode. Possible values are `PERSONAL`

  ---
  `radius_configuration` - Radius configuration
  - `profile_id` - Radius profile Id. You can use the `radius_profiles` sub-module to get the radius profile id.
  - `nas_id` - WiFi Radius NAS Id.
    - `type` - Type of the NAS Id. Possible values are `DERIVED` and `USER_DEFINED`.
    - `source` - Source of the NAS Id. Required if the NAS Id type is `DERIVED`.
    - `value` - Value of the NAS Id. Required if the NAS Id type is `USER_DEFINED`.
  - `mac_authentication_configuration` - MAC Authentication configuration.
    - `mac_address_format` - MAC address format.

  ---
  `sae_configuration` - Configuration for SAE (Simultaneous Authentication of Equals).
  - `anticlogging_threshold_seconds` - SAE Anti-clogging
  - `sync_time_seconds` - SAE Sync Time

  ---
  `pre_shared_keys` - List of pre-shared keys. Required when type is `WPA2_PERSONAL`, `WPA3_PERSONAL` or `WPA2_WPA3_PERSONAL`. This is an alternative to using the `passphrase` variable and allows you to set different passphrases for different VLANs.
  - `network` - Network configuration for the pre-shared key.
    - `type` - Type of the network. Possible values are `NATIVE` and `SPECIFIC`. If `SPECIFIC` is used, the `network_id` key must be set.
    - `network_id` - Network Id. Required if the network type is `SPECIFIC`.
  - `passphrase` - Passphrase for the pre-shared key.

  ---
  `sae_configuration` - Configuration for SAE (Simultaneous Authentication of Equals).
  - `anticlogging_threshold_seconds`
  - `sync_time_seconds`


  ## Example

  ```hcl

  ```

  ## Default

  ```hcl
  {
    type = "OPEN"
  }
  ```

  DESCRIPTION

  type = object({
    type = string
    radius_configuration = optional(object({
      profile_id = string
      nas_id = object({
        # DERIVED or USER_DEFINED
        type   = string
        source = optional(string)
        value  = optional(string)
      })
      mac_authentication_configuration = optional(object({
        mac_address_format = string
      }))
    }))
    # Group rekey interval in seconds. Sets how often connected device groups are assigned a new key.
    # If null, then it is disabled. This feature is not available for IoT configuration.
    group_rekey_interval_seconds = optional(number)

    # Fast roaming enabled flag. This feature is not available for IoT configuration.
    enable_fast_roaming = optional(bool)

    # Passphrase to connect to the WiFi.
    passphrase = optional(string)

    # Pre-shared keys.
    pre_shared_keys = optional(list(object({
      network = object({
        type       = string
        network_id = optional(string)
      })
      passphrase = string
    })))

    # Protected Management Frames mode.
    # If null, then it is disabled. This feature is not available for IoT configuration.
    pmf_mode = optional(string)

    # WPA3 fast roaming can be enabled only if the default fast roaming is enabled
    enable_wpa3_fast_roaming = optional(bool)

    # Configuration for SAE (Simultaneous Authentication of Equals).
    sae_configuration = optional(object({
      anticlogging_threshold_seconds = number
      sync_time_seconds              = number
    }))

    # Enable COA
    # Indicates whether Change of Authorization (COA) is enabled
    enable_coa = optional(bool)

    # Security Mode
    security_mode = optional(string)
  })

  nullable = false
  default = {
    type = "OPEN"
  }

  validation {
    condition = contains([
      "OPEN",
      "WPA2_PERSONAL",
      "WPA3_PERSONAL",
      "WPA2_WPA3_PERSONAL",
      "WPA2_ENTERPRISE",
      "WPA3_ENTERPRISE",
      "WPA2_WPA3_ENTERPRISE"
    ], var.security_configuration.type)
    error_message = "The 'security_configuration.type' variable must be either 'OPEN', 'WPA2_PERSONAL', 'WPA3_PERSONAL', 'WPA2_WPA3_PERSONAL', 'WPA2_ENTERPRISE', 'WPA3_ENTERPRISE' or 'WPA2_WPA3_ENTERPRISE'."
  }
}

variable "broadcasting_device_filter" {
  description = <<DESCRIPTION
  ## Description

  Defines the custom scope of devices that will broadcast this WiFi network. If null, the WiFi network will be broadcast by all Access Point capable devices.

  - `type` - Type of the filter. Possible values are `DEVICES` and `DEVICE_TAGS`.
  - `device_ids` - List of Access Point capable device IDs to which the WiFi broadcast applies. Required if the filter type is `DEVICES`. You can use the `devices` sub-module to get the device ids.
  - `device_tags_ids` - List device tag IDs to which the WiFi broadcast applies. Required if the filter type is `DEVICE_TAGS`. You can use the `device_tags` sub-module to get the device tag ids.

  ## Examples

  ```hcl
  {
    type = "DEVICE_TAGS"
    device_tag_ids = [
      "ap_garage",
      "ap_garden"
    ]
  }

  ```


  ## Default

  NULL

  DESCRIPTION

  type = object({
    type           = string
    device_ids     = optional(list(string))
    device_tag_ids = optional(list(string))
  })
  nullable = true
  default  = null
}

variable "mdns_proxy_configuration" {
  description = <<DESCRIPTION
  ## Description

  mDNS filtering configuration.

  - `mode` - mDNS proxy mode. Possible values are `AUTO` and `CUSTOM`.
  - `policies` - Array of mDNS proxy policies. Required if the mode is `CUSTOM`.
    - `action` - Action to apply for matching mDNS traffic. Possible values are `ALLOW`and `BLOCK`
    - `device_filter` - Defines the custom scope of devices that will filter Mdns. If null, the mDNS filtering will be added to all Access Point capable devices.
    - `service_filter` - Array of object (mDNS service)
      - `type` - `PREDEFINED` or `CUSTOM`
      - `name` - Name of the service.
      - `type_domain` - Type domain of the service. Required if the service type is `CUSTOM`.
    - `bridging_network_ids` - Array of network ids.

  ## Example

  ```hcl
  {
    mode = "AUTO"
  }
  ```

  ## Default

  ```hcl
  {
    mode = "AUTO"
  }
  ```

  DESCRIPTION

  type = object({
    mode = string
    policies = optional(list(object({
      action = string
      device_filter = optional(object({
        action = string
        device_filter = optional(object({
          type           = string
          device_ids     = optional(list(string))
          device_tag_ids = optional(list(string))
        }))
        service_filter = optional(list(object({
          type        = string
          name        = optional(string)
          type_domain = optional(string)
        })))
        bridging_network_ids = optional(list(string))
      }))
    })))
  })
  nullable = true
  default = {
    mode = "AUTO"
  }
}


variable "multicast_filtering_policy" {
  description = <<DESCRIPTION
  ## Description

  Multicast filtering policy.

  - `action` - Action to apply for matching multicast traffic. Possible values are `ALLOW`and `BLOCK`
  - `source_mac_address_filter` - List of multicast source MAC addresses allowed. Multicast traffic from gateways is always allowed. Required if action is ALLOW.

  ## Examples

  ## Block all multicast traffic

  ```hcl
  {
    action = "BLOCK"
  }
  ```

  ## Allow multicast traffic from specific devices

  ```hcl
  {
    action = "ALLOW"
    source_mac_address_filter = [
      "d8:eb:46:ff:ff:ff", # Google Chromecast
      "ac:67:84:ff:ff:ff", # Google Nest Audio
      "14:c1:4e:ff:ff:ff", # Google Chromecast Audio
    ]
  }
  ```

  ## Default

  Null

  DESCRIPTION

  type = object({
    action                    = string
    source_mac_address_filter = optional(list(string))
  })
  nullable = true
  default  = null
}

variable "enable_multicast_to_unicast_conversion" {
  description = <<DESCRIPTION
  ## Description

  Converts multicast WiFi traffic to unicast, when possible.

  ## Example

  - `true`
  - `false`

  ## Default

  `true`

  DESCRIPTION

  type     = bool
  nullable = false
  default  = true
}

variable "enable_client_isolation" {
  description = <<DESCRIPTION
  ## Description

  Enable client isolation.

  ## Example

  - `true`
  - `false`

  ## Default

  `false`

  DESCRIPTION

  type     = bool
  nullable = false
  default  = false
}

variable "hide_wifi_name" {
  description = <<DESCRIPTION
  ## Description

  Hide WiFi Network name.

  ## Example

  - true
  - false

  ## Default

  false

  DESCRIPTION

  type     = bool
  nullable = false
  default  = false
}

variable "enable_uapsd" {
  description = <<DESCRIPTION
  ## Description

  Enable Unscheduled Automatic Power Save Delivery (U-APSD).

  ## Example

  - true
  - false

  ## Default

  false

  DESCRIPTION

  type     = bool
  nullable = false
  default  = false
}

variable "basic_data_rate_kbps_by_frequency_ghz" {
  description = <<DESCRIPTION
  ## Description

  Basic data rates in Kbps by frequency in Ghz.

  - `2.4` - List of data rates for the 2.4 Ghz band
  - `5` - List of data rates for the 5 Ghz band

  ## Example

  ```hcl
  {
    "2.4": [1000, 2000, 5500, 11000],
    "5": [6000, 9000, 12000, 18000, 24000, 36000, 48000, 54000]
  }
  ```

  ## Default

  Null

  DESCRIPTION

  type     = map(list(number))
  nullable = true
  default  = null

  validation {
    condition = var.basic_data_rate_kbps_by_frequency_ghz == null || alltrue([
      for frequency, data_rate in var.basic_data_rate_kbps_by_frequency_ghz : contains(["2.4", "5"], frequency)
    ])
    error_message = "Only 2.4 and 5 GHz frequencies are allowed."
  }
}

variable "client_filtering_policy" {
  description = <<DESCRIPTION
  ## Description

  Client connection filtering policy.
  Allow/restrict access to the WiFi network based on client device MAC addresses.

  - `action` - Action to apply. Possible values are `BLOCK` and `ALLOW`.
  - `mac_address_filter` - List of client MAC addresses.

  ## Example

  ```hcl
  {
    action = "ALLOW"
    mac_address_filter = [
      "d8:eb:46:ff:ff:ff", # Google Chromecast
      "ac:67:84:ff:ff:ff", # Google Nest Audio
      "14:c1:4e:ff:ff:ff", # Google Chromecast Audio
    ]
  }

  ## Default

  Null

  DESCRIPTION

  type = object({
    action             = string
    mac_address_filter = list(string)
  })
  nullable = true
  default  = null
}


variable "blackout_schedule_configuration" {
  description = <<DESCRIPTION
  ## Description

  Time when this WiFi is disabled.

  - `days` - List of days when the WiFi is disabled
    - `type` - Type of blackout. Possible values are `ALL_DAY` and `TIME_RANGE`.
    - `day` - Day of the week when the WiFi is disabled. Required when `type` is `ALL_DAY``
    - `time_ranges` - List of time ranges
      - `start_time` - Start time in 24-hour format (HH:mm)
      - `end_time` - End time in 24-hour format (HH:mm)

  ## Example

  ```hcl
  {
    days = [
      {
        type = "ALL_DAY"
        day = "SUNDAY"
      },
      {
        type = "TIME_RANGE"
        day = "MONDAY"
        time_ranges = [
          {
            start_time = "22:00"
            end_time = "06:00"
          },
          {
            start_time = "12:00"
            end_time = "14:00"
          }
        ]
      }
    ]
  }
  ```

  ## Default

  Null

  DESCRIPTION

  type = object({
    days = list(object({
      # ALL_DAY or TIME_RANGE
      type = string
      day  = string
      time_ranges = optional(list(object({
        # Start time in 24-hour format (HH:mm)
        start_time = string
        # End time in 24-hour format (HH:mm)
        end_time = string
      })))
    }))
  })
  nullable = true
  default  = null

  validation {
    condition     = var.blackout_schedule_configuration == null || contains(["ALL_DAY", "TIME_RANGE"], var.blackout_schedule_configuration.days[*].type)
    error_message = "The 'blackout_schedule_configuration.days[*].type' variable must be either 'ALL_DAY' or 'TIME_RANGE'."
  }
}

variable "broadcasting_frequencies_ghz" {
  description = <<DESCRIPTION
  ## Description

  Broadcasting frequencies in Ghz. Possible values are defined by access point capabilities.

  ## Examples

  ### Example broadcasting on both 2.4 and 5 Ghz frequencies

  ```hcl
  [
    2.4,
    5
  ]
  ```

  ### Example broadcasting only on 6 Ghz frequency

  ```hcl
  [6]
  ```

  ## Default

  Null

  DESCRIPTION

  type     = list(number)
  nullable = true
  default  = null
}

variable "hotspot_configuration" {
  description = <<DESCRIPTION
  ## Description

  WiFi Hotspot configuration.

  - `type` - Type of WiFi hotspot. Possible values are `CAPTIVE_PORTAL` and `PASSPOINT`.

  ## Note

  `PASSPOINT` type is not yet supported by the Unifi Network API.

  ## Example

  ### Captive portal hotspot configuration

  ```hcl
  {
    type = "CAPTIVE_PORTAL"
  }

  ### Passpoint hotspot configuration

  ```hcl
  {
    type = "PASSPOINT"
  }
  ```


  ## Default

  Null

  DESCRIPTION

  type = object({
    # CAPTIVE_PORTAL or PASSPOINT
    type = string
  })
  nullable = true
  default  = null

  validation {
    condition     = var.hotspot_configuration == null || contains(["CAPTIVE_PORTAL", "PASSPOINT"], var.hotspot_configuration.type)
    error_message = "The 'hotspot_configuration.type' variable must be either 'CAPTIVE_PORTAL' or 'PASSPOINT'."
  }
}

variable "enable_mlo" {
  description = <<DESCRIPTION
  ## Description

  Enable Multi-Link Operation (MLO).

  ## Example

  - `true`
  - `false`

  ## Default

  Null

  DESCRIPTION

  type     = bool
  nullable = true
  default  = null
}

variable "enable_band_steering" {
  description = <<DESCRIPTION
  ## Description

  Enable Band Sterring.

  ## Example

  - `true`
  - `false`

  ## Default

  Null

  DESCRIPTION

  type     = bool
  nullable = true
  default  = null
}

variable "enable_arp_proxy" {
  description = <<DESCRIPTION
  ## Description

  Reduces airtime usage by allowing APs to 'proxy' common broadcast frames as unicast.
  This can improve latency, but may cause connectivity issues in some networks.

  ## Example

  - `true`
  - `false`

  ## Default

  Null

  DESCRIPTION

  type     = bool
  nullable = true
  default  = null
}

variable "enable_bss_transition" {
  description = <<DESCRIPTION
  ## Description

  Enable BSS Transition.

  ## Example

  - `true`
  - `false`

  ## Default

  Null

  DESCRIPTION

  type     = bool
  nullable = true
  default  = null
}

variable "advertise_device_name" {
  description = <<DESCRIPTION
  ## Description

  Indicates whether the device name is advertised in beacon frames.

  ## Example

  - `true`
  - `false`

  ## Default

  Null

  DESCRIPTION

  type     = bool
  nullable = true
  default  = null
}

variable "dtim_period_by_frequency_ghz_override" {
  description = <<DESCRIPTION
  ## Description

  DTIM (Delivery Traffic Indication Message) period override by frequency in Ghz.

  - `2.4` - DTIM period override for the 2.4 Ghz band
  - `5` - DTIM period override for the 5 Ghz band
  - `6` - DTIM period override for the 6 Ghz band (if supported by the access points)

  ## Example

  ```hcl
  {
    "2.4": 1,
    "5": 3,
    "6": 3
  }
  ```

  ## Default

  Null

  DESCRIPTION

  type     = map(number)
  nullable = true
  default  = null

  validation {
    condition = var.dtim_period_by_frequency_ghz_override == null || alltrue([
      for frequency, dtim_period in var.dtim_period_by_frequency_ghz_override : contains(["2.4", "5", "6"], frequency)
    ])
    error_message = "Only 2.4, 5, and 6 GHz frequencies are allowed."
  }
}
