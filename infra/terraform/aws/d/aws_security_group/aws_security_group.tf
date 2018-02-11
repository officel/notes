# https://www.terraform.io/docs/providers/aws/d/security_group.html

data "aws_vpc" "default" {
  default = true
}

// greoup_name が default なのが VPC のデフォルトセキュリティグループでいいはず。。。
data "aws_security_group" "default" {
  description = "default security group"
  vpc_id      = "${data.aws_vpc.default.id}"

  filter {
    name = "group-name"

    values = [
      "default",
    ]
  }
}

output "aws_security_group.default" {
  value = "${data.aws_security_group.default.id}"
}
