locals {
  format_ymd  = "%04d/%02d/%02d"
  format_ymd2 = "%s/%s/%s"
}

output "format" {
  value = "${format(local.format_ymd, 2018, 1, 1)}"
}

output "format_base_2" {
  description = "base 2. maybe return 1010"
  value       = "${format("%b", 10)}"
}

output "format_base_8" {
  description = "base 8. maybe return 12"
  value       = "${format("%o", 10)}"
}

output "format_base16_l" {
  description = "base 16. maybe return ff"
  value       = "${format("%x", 255)}"
}

output "format_base16_u" {
  description = "base 16. maybe return FF"
  value       = "${format("%X", 255)}"
}

// formatlist

variable "formatlist_y" {
  type = "list"

  default = [
    2017,
    2018,
    2019,
  ]
}

variable "formatlist_m" {
  type = "list"

  default = [
    1,
    2,
    3,
  ]
}

variable "formatlist_d" {
  type = "list"

  default = [
    10,
    11,
    12,
  ]
}

output "formatlist_1" {
  description = "listの値が文字列扱いになってしまう？"
  value       = "${formatlist(local.format_ymd, var.formatlist_y, var.formatlist_m, var.formatlist_d)}"
}

output "formatlist_2" {
  description = "文字列フォーマットでは機能する"
  value       = "${formatlist(local.format_ymd2, var.formatlist_y, var.formatlist_m, var.formatlist_d)}"
}
