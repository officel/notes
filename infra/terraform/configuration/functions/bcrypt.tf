variable "bcrypt_string" {
  default = "password"
}

output "bcrypt" {
  value = "${bcrypt(var.bcrypt_string)}"
}
