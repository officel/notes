locals {
  timeadd = {
    "1. now" = "${timestamp()}"
    "2. 10h" = "${timeadd(timestamp(), "10h")}"
    "3. 10m" = "${timeadd(timestamp(), "10m")}"
    "4. 10s" = "${timeadd(timestamp(), "10s")}"

    // d 以降の表記は使えないようだ（そもそもmも本来monthな気がする）
  }
}

output "timeadd" {
  value = "${local.timeadd}"
}
