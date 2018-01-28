variable "upper_lower_1" {
  default = "This is sample text. for UPPER or LOWER function"
}

output "upper_lower_u1" {
  value = "${upper(var.upper_lower_1)}"
}

output "upper_lower_l1" {
  value = "${lower(var.upper_lower_1)}"
}
