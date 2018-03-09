variable "cidrsubnet_iprange" {
  default = "10.0.0.0/8"
}

variable "cidrsubnet_newbits" {
  default = 8
}

variable "cidrsubnet_netnum" {
  default = 2
}

output "cidrsubnet" {
  value = "${cidrsubnet(var.cidrsubnet_iprange, var.cidrsubnet_newbits, var.cidrsubnet_netnum)}"
}
