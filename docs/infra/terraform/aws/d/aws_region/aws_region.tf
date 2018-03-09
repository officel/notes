# https://www.terraform.io/docs/providers/aws/d/region.html

data "aws_region" "current" {}

locals {
  current = {
    name     = "${data.aws_region.current.name}"
    current  = "${data.aws_region.current.current}"
    endpoint = "${data.aws_region.current.endpoint}"
  }
}

output "aws_region.current" {
  value = "${local.current}"
}

data "aws_region" "tokyo" {
  name = "ap-northeast-1"
}

locals {
  tokyo = {
    name     = "${data.aws_region.tokyo.name}"
    current  = "${data.aws_region.tokyo.current}"
    endpoint = "${data.aws_region.tokyo.endpoint}"
  }
}

output "aws_region.tokyo" {
  value = "${local.tokyo}"
}

data "aws_region" "oregon" {
  endpoint = "ec2.us-west-2.amazonaws.com"
}

locals {
  oregon = {
    name     = "${data.aws_region.oregon.name}"
    current  = "${data.aws_region.oregon.current}"
    endpoint = "${data.aws_region.oregon.endpoint}"
  }
}

output "aws_region.oregon" {
  value = "${local.oregon}"
}
