variable "base64_string" {
  default = "input string"
}

locals {
  // 入力文字列
  base64_string = "${var.base64_string}"

  base64_encode = "${base64encode(local.base64_string)}"
  base64_decode = "${base64decode(local.base64_encode)}"

  // バイナリデータを安全に文字列化する（ここではしない
  base64gzip = "${base64gzip(local.base64_string)}"

  base64sha256 = "${base64sha256(local.base64_string)}"
  base64sha512 = "${base64sha512(local.base64_string)}"
}

output "base64_encode" {
  value = "${local.base64_encode}"
}

output "base64_decode" {
  value = "${local.base64_decode}"
}

output "base64gzip" {
  value = "${local.base64gzip}"
}

output "base64sha256" {
  value = "${local.base64sha256}"
}

output "base64sha512" {
  value = "${local.base64sha512}"
}
