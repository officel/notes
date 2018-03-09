variable "md5" {
  default = "maji de koi suru 5 byou mae"
}

output "md5" {
  value = "${md5(var.md5)}"
}
