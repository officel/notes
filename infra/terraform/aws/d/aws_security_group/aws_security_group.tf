# https://www.terraform.io/docs/providers/aws/d/security_group.html

data "aws_vpc" "default" {
  default = true
}

// greoup_name が default なのが VPC のデフォルトセキュリティグループでいいはず。。。
data "aws_security_group" "default" {
  vpc_id = "${data.aws_vpc.default.id}"

  filter {
    name = "group-name"

    values = [
      "default",
    ]
  }
}

output "aws_security_group.default" {
  description = "default security group by group_name default"
  value       = "${data.aws_security_group.default.id}"
}

// name = default もVPCのデフォルトセキュリティグループを指す
// ちなみに新しいセキュリティグループを作成する時のnameにdefaultは使えないみたい
data "aws_security_group" "default_name" {
  vpc_id = "${data.aws_vpc.default.id}"
  name   = "default"
}

output "aws_security_group.default_name" {
  description = "default security group by name default"
  value       = "${data.aws_security_group.default_name.id}"
}
