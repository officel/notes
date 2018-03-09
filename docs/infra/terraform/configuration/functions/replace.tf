variable "replace_string" {
  default = "i love terraform"
}

variable "replace_search" {
  default = "i love"
}

variable "replace_replase" {
  default = "We love"
}

output "replace" {
  value = "${replace(var.replace_string, var.replace_search, var.replace_replase)}"
}
