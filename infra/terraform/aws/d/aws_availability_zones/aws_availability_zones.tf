# [AWS: aws_availability_zones - Terraform by HashiCorp](https://www.terraform.io/docs/providers/aws/d/availability_zones.html)

data "aws_availability_zones" "available" {
  state = "available"
}

output "aws_availability_zones" {
  description = "ap-northeast-1 の場合に 1b が使えるアカウントがある（古いアカウントだ）"
  value       = "${data.aws_availability_zones.available.names}"
}
