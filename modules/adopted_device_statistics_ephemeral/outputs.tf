output "adopted_device_statistics_ephemeral" {
  description = <<DESCRIPTION
  ## Description

  Statistics of an adopted device.

  ## Learn more

  https://developer.ui.com/network/v10.1.68/getadopteddevicelateststatistics

  ## Example
  ```hcl
  {
    "uptimeSec"             = 5704058
    "lastHeartbeatAt"       = "2026-01-24T23:04:12Z"
    "nextHeartbeatAt"       = "2026-01-24T23:04:27Z"
    "cpuUtilizationPct"     = 5.8
    "memoryUtilizationPct"  = 77.2
    "uplink"                = {
      "txRateBps" = 0
      "rxRateBps" = 0
    }
    "interfaces"            = {}
  }
  ```

  DESCRIPTION

  value     = ephemeral.restful_resource.adopted_device_statistics.output
  ephemeral = true
}
