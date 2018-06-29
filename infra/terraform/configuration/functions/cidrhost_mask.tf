// see [VPC とサブネット - Amazon Virtual Private Cloud](https://docs.aws.amazon.com/ja_jp/AmazonVPC/latest/UserGuide/VPC_Subnets.html)

variable "cidrhost_cidr" {
  default = "10.0.0.0/16"
}

output "cidrhost_amazon_provided_dns_address" {
  description = "AmazonProvidedDNS IP Address"
  value       = "${cidrhost(var.cidrhost_cidr, 2)}"
}

output "cidrhost_can_use_max_address" {
  description = "IP Address before Network broadcast address"
  value       = "${cidrhost(var.cidrhost_cidr, -2)}"
}

output "cidrhost_cidrmask" {
  value = "${cidrnetmask(var.cidrhost_cidr)}"
}
