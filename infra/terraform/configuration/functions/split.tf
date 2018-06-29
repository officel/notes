variable "split_strings" {
  default = "a,b,c,d,e,f,g"
}

locals {
  split = "${split(",", var.split_strings)}"
}

output "split" {
  value = "${local.split}"
}
