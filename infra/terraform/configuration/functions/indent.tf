variable "indent_file" {
  default = "indent.txt"
}

locals {
  indent_file = "${file(var.indent_file)}"
}

output "indent" {
  description = "先頭行は処理されない。末尾改行は処理される"
  value = "\"${indent(4, local.indent_file)}\""
}
