# EC2 インスタンスプロファイル（IAM Roles for EC2）を作る

// https://docs.aws.amazon.com/ja_jp/AWSEC2/latest/UserGuide/iam-roles-for-amazon-ec2.html
// https://docs.aws.amazon.com/ja_jp/codedeploy/latest/userguide/getting-started-create-service-role.html

variable "ec2_role_name" {
  description = "EC2 Instance Role & Profile name"
  default     = "ec2"
}

resource "aws_iam_instance_profile" "ec2" {
  // インスタンスプロファイル自体はマネジメントコンソールからは見えない
  name = "${var.ec2_role_name}"
  role = "${aws_iam_role.ec2.name}"
}

resource "aws_iam_role" "ec2" {
  // ロールの概要のインスタンスプロファイル ARN に値があるかないかでわかる
  name               = "${var.ec2_role_name}"
  assume_role_policy = "${data.aws_iam_policy_document.ec2.json}"
}

data "aws_iam_policy_document" "ec2" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type = "Service"

      identifiers = [
        "ec2.amazonaws.com",
        "codedeploy.amazonaws.com",
      ]
    }
  }
}
