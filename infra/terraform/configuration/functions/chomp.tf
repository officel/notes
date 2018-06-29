variable "chomp_straing_1" {
  default = " space "
}

output "chomp_string_1" {
  description = "no removes"
  value       = "\"${chomp(var.chomp_straing_1)}\""

  // space を除去するなら trimspace()
}

variable "chomp_straing_2" {
  default = "new line\nand new line"
}

output "chomp_string_2" {
  description = "no removes not trail"
  value       = "\"${chomp(var.chomp_straing_2)}\""
}

variable "chomp_straing_3" {
  default = "new line\nand new line\n\n\n"
}

output "chomp_string_3" {
  description = "only removes all trailing newline"
  value       = "\"${chomp(var.chomp_straing_3)}\""
}
