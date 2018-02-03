variable "substr_strings" {
  description = ""
  default = "1234567789abcdef"
}

output "substr(str,0,1)" {
  value = "${substr(var.substr_strings, 0, 1)}"
}

output "substr(str,10,-1)" {
  value = "${substr(var.substr_strings, 10, -1)}"
}
