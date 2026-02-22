output "dpi_applications" {
  description = <<DESCRIPTION
  ## Description

  List of DPI Applications managed by the Unifi Network Application.

  ## Learn more

  https://developer.ui.com/network/v10.1.84/getdpiapplications

  ## Example

  ```hcl
  {
    "count" = 20
    "data" = [
      {
        "id" = 3
        "name" = "ICQ"
      },
      {
        "id" = 4
        "name" = "QQ/TM"
      },
      {
        "id" = 5
        "name" = "DingTalk"
      },
      {
        "id" = 6
        "name" = "IRC"
      },
      {
        "id" = 10
        "name" = "Gadu-Gadu"
      },
      {
        "id" = 11
        "name" = "Yixin"
      },
      {
        "id" = 12
        "name" = "POPO"
      },
      {
        "id" = 14
        "name" = "Wlt"
      },
      {
        "id" = 16
        "name" = "Omegle"
      },
      {
        "id" = 17
        "name" = "IPMSG"
      },
      {
        "id" = 18
        "name" = "AliWW"
      },
      {
        "id" = 19
        "name" = "Mail.ru IM"
      },
      {
        "id" = 21
        "name" = "Lava-Lava"
      },
      {
        "id" = 22
        "name" = "Paltalk"
      },
      {
        "id" = 24
        "name" = "WinpopupX"
      },
      {
        "id" = 27
        "name" = "Apple iMessage"
      },
      {
        "id" = 29
        "name" = "iSpQ"
      },
      {
        "id" = 30
        "name" = "Momo"
      },
      {
        "id" = 32
        "name" = "Caihong"
      },
      {
        "id" = 34
        "name" = "IMVU"
      },
    ]
    "limit" = 20
    "offset" = 0
    "totalCount" = 2112
  }
  ```

  DESCRIPTION

  value = data.restful_resource.dpi_applications.output
}
