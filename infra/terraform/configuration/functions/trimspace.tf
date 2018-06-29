variable "trimspace_1" {
  default = " space "
}

output "trimspace_1" {
  value = "\"${trimspace(var.trimspace_1)}\""
}

variable "trimspace_2" {
  default = " space space new\nline space \n "
}

output "trimspace_2_0" {
  value = "\"${var.trimspace_2}\""
}

output "trimspace_2_1" {
  // 改行もtrimされる
  value = "\"${trimspace(var.trimspace_2)}\""
}
