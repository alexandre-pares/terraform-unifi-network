locals {
  wifi_properties = merge(
    {
      # Type of WiFi
      # STANDARD or IOT_OPTIMIZED
      type = var.type

      # Name of the WiFi SSID
      name = var.name
    },

    # Network Configuration (can be null if using pre-shared Keys)
    (var.network != null) ? {
      # Network this WiFi is associated with.
      network = (var.network.type == "NATIVE") ? {
        type = "NATIVE"
        } : {
        type      = "SPECIFIC"
        networkId = var.network.network_id
      }
    } : {},

    {
      # Enable the WiFi
      enabled = var.enabled

      # Security Configuration
      securityConfiguration = merge(
        {
          type = var.security_configuration.type
        },

        # Radius Configuration
        (try(var.security_configuration.radius_configuration, null) != null) ? {
          radiusConfiguration = merge({
            profileId = var.security_configuration.radius_configuration.profile_id
            nasId     = var.security_configuration.radius_configuration.nas_id
            },
            (try(var.security_configuration.radius_configuration.mac_authentication_configuration, null) != null) ? {
              macAuthenticationConfiguration = {
                macAddressFormat = var.security_configuration.radius_configuration.mac_authentication_configuration.mac_address_format
              }
            } : {}
          )
        } : {},

        # Group rekey interval in seconds. Sets how often connected device groups are assigned a new key.
        # If null, then it is disabled. This feature is not available for IoT configuration.
        (try(var.security_configuration.group_rekey_interval_seconds, null) != null) ? {
          groupRekeyIntervalSeconds = var.security_configuration.group_rekey_interval_seconds
        } : {},

        # Fast roaming enabled flag.
        # This feature is not available for IoT configuration.
        (try(var.security_configuration.enable_fast_roaming, null) != null) ? {
          fastRoamingEnabled = var.security_configuration.enable_fast_roaming
        } : {},

        # Passphrase
        (try(var.security_configuration.passphrase, null) != null) ? {
          passphrase = var.security_configuration.passphrase
        } : {},

        # SAE configuration
        (try(var.security_configuration.sae_configuration, null) != null) ? {
          # Configuration for SAE (Simultaneous Authentication of Equals).
          saeConfiguration = {
            anticloggingThresholdSeconds = var.security_configuration.sae_configuration.anticlogging_threshold_seconds
            syncTimeSeconds              = var.security_configuration.sae_configuration.sync_time_seconds
          }
        } : {},

        # Pre-shared keys
        (try(var.security_configuration.pre_shared_keys, null) != null) ? {
          presharedKeys = [for key in var.security_configuration.pre_shared_keys : merge({
            passphrase = key.passphrase
            },
            (key.network.type == "NATIVE") ? {
              network = {
                type = "NATIVE"
              }
            } : {},
            (key.network.type == "SPECIFIC") ? {
              network = {
                type      = "SPECIFIC"
                networkId = key.network.network_id
              }
            } : {}
          )]
        } : {},

        # Protected Management Frames mode.
        # If null, then it is disabled. This feature is not available for IoT configuration.
        (var.security_configuration.pmf_mode != null) ? {
          pmfMode = var.security_configuration.pmf_mode
        } : {},

        # WPA3 fast roaming
        (var.security_configuration.enable_wpa3_fast_roaming != null) ? {
          wpa3FastRoamingEnabled = var.security_configuration.enable_wpa3_fast_roaming
        } : {},

        # Change of Authorization (COA)
        # Indicates whether Change of Authorization (COA) is enabled
        (var.security_configuration.enable_coa != null) ? {
          coaEnabled = var.security_configuration.enable_coa
        } : {},

        # Security Mode
        (var.security_configuration.security_mode != null) ? {
          securityMode = var.security_configuration.security_mode
        } : {}
      )
    },

    # Broadcasting device filter
    (var.broadcasting_device_filter != null) ? {
      broadcastingDeviceFilter = merge({
        type = var.broadcasting_device_filter.type
        },
        (var.broadcasting_device_filter.type == "DEVICES") ? {
          deviceIds = var.broadcasting_device_filter.device_ids
        } : {},
        (var.broadcasting_device_filter.type == "DEVICE_TAGS") ? {
          deviceTagIds = var.broadcasting_device_filter.device_tag_ids
        } : {}
      )
    } : {},

    # mDNS proxy configuration
    (var.mdns_proxy_configuration != null) ? {
      mdnsProxyConfiguration = (var.mdns_proxy_configuration.type == "AUTO") ? {
        type = "AUTO"
        } : {
        type = "CUSTOM"
        policies = [for policy in var.mdns_proxy_configuration.custom_policies : merge(
          {
            action = policy.action
          },

          # Device Filter
          # Defines the custom scope of devices that will filter Mdns.
          # If null, the mDNS filtering will be added to all Access Point capable devices.
          (policy.device_filter != null) ? {
            deviceFilter = merge({
              type = policy.device_filter.type
              },
              (policy.device_filter == "DEVICES") ? {
                # List of Access Point capable device IDs to which the WiFi broadcast applies.
                deviceIds = policy.device_filter.device_ids
                } : {
                # device_filter is DEVICE_TAGS
                deviceTagIds = policy.device_filter.device_tag_ids
            })
          } : {},

          # Service Filter, only if the policy action is ALLOW
          # Array of object (mDNS service)
          (policy.action == "ALLOW" && policy.service_filter != null) ? {
            serviceFilter = [for service in policy.service_filter : merge({
              type = policy.service_filter.type
              name = policy.service_filter.name
              },
              (policy.service_filter.type == "CUSTOM") ? {
                typeDomain = policy.service_filter.type_domain
              } : {})
            ]
          } : {},

          # Bridging Networks, only if the policy action is ALLOW
          (policy.action == "ALLOW" && policy.bridging_network_ids != null) ? {
            bridgingNetworkIds = policy.bridging_network_ids
          } : {}

        )]
      }
    } : {},

    # Multicast Filtering Policy
    (var.multicast_filtering_policy != null) ? {
      multicastFilteringPolicy = merge({
        action = var.multicast_filtering_policy.action
        },
        (var.multicast_filtering_policy.action == "ALLOW") ? {
          # List of multicast source MAC addresses allowed. Multicast traffic from gateways is always allowed.
          sourceMacAddressFilter = var.multicast_filtering_policy.source_mac_address_filter
        } : {}
      )
    } : {},

    # Multicast to Unicast conversion
    {
      multicastToUnicastConversionEnabled = var.enable_multicast_to_unicast_conversion
    },

    # Client Isolation
    {
      clientIsolationEnabled = var.enable_client_isolation
    },

    # Hide WiFi name
    {
      hideName = var.hide_wifi_name
    },

    # U-APSD
    {
      # Indicates whether Unscheduled Automatic Power Save Delivery (U-APSD) is enabled
      uapsdEnabled = var.enable_uapsd
    },

    # Basic Data Rates by Frequency (2.4 or 5Ghz)
    (var.basic_data_rate_kbps_by_frequency_ghz != null) ? {
      basicDataRateKbpsByFrequencyGHz = var.basic_data_rate_kbps_by_frequency_ghz
    } : {},

    # Client Filtering Policy
    (var.client_filtering_policy != null) ? {
      # Client connection filtering policy. Allow/restrict access to the WiFi network based on client device MAC addresses.
      clientFilteringPolicy = {
        action           = var.client_filtering_policy.action
        macAddressFilter = var.client_filtering_policy.mac_address_filter
      }
    } : {},

    # Blackout Schedule Configuration
    (var.blackout_schedule_configuration != null) ? {
      blackoutScheduleConfiguration = {
        days = [for day in var.blackout_schedule_configuration.days : merge({
          # ALL_DAY or TIME_RANGE
          type = day.type
          day  = day.day
          },
          (day.type == "TIME_RANGE") ? {
            timeRanges = [for time_range in day.time_ranges : {
              # Start time in 24-hour format (HH:mm)
              startTime = time_range.start_time
              # End time in 24-hour format (HH:mm)
              endTime = time_range.end_time
              }
            ]
          } : {}
        )]
      }
    } : {},

    # Broadcasting Frequencies
    (var.broadcasting_frequencies_ghz != null) ? {
      broadcastingFrequenciesGHz = var.broadcasting_frequencies_ghz
    } : {},

    # Hotspot configuration
    (var.hotspot_configuration != null) ? {
      hotspotConfiguration = var.hotspot_configuration
    } : {},

    # MLO
    (var.enable_mlo != null) ? {
      mloEnabled = var.enable_mlo
    } : {},

    # Band Steering
    (var.enable_band_steering != null) ? {
      bandSteeringEnabled = var.enable_band_steering
    } : {},

    # ARP Proxy
    (var.enable_arp_proxy != null) ? {
      arpProxyEnabled = var.enable_arp_proxy
    } : {},

    # BSS Transition
    (var.enable_bss_transition != null) ? {
      bssTransitionEnabled = var.enable_bss_transition
    } : {},

    # Advertise Device Name
    (var.advertise_device_name != null) ? {
      advertiseDeviceName = var.advertise_device_name
    } : {},

    # DTIM Period by Frequency (2.4 or 5Ghz)
    (var.dtim_period_by_frequency_ghz_override != null) ? {
      dtimPeriodByFrequencyGHzOverride = var.dtim_period_by_frequency_ghz_override
    } : {}
  )
}
