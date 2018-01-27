// see [VPC とサブネット - Amazon Virtual Private Cloud](https://docs.aws.amazon.com/ja_jp/AmazonVPC/latest/UserGuide/VPC_Subnets.html)

output "cidrhost_amazon_provided_dns_address" {
  description = "AmazonProvidedDNS IP Address"
  value       = "${cidrhost(data.aws_vpc.default.cidr_block, 2)}"
}

output "cidrhost_can_use_max_address" {
  description = "IP Address before Network broadcast address"
  value       = "${cidrhost(data.aws_vpc.default.cidr_block, -2)}"
}
