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
  assume_role_policy = "${data.aws_iam_policy_document.ec2_assume.json}"
}

data "aws_iam_policy_document" "ec2_assume" {
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

// AWS管理のポリシーをアタッチしてアクセス権を付与する

// see https://docs.aws.amazon.com/ja_jp/codedeploy/latest/userguide/getting-started-create-service-role.html
resource "aws_iam_role_policy_attachment" "ec2_codedeploy" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
  role       = "${aws_iam_role.ec2.id}"
}

// list,getの他にS3のアクセスログを書き出すためにputも必要で適切なポリシーがないので一旦フル
resource "aws_iam_role_policy_attachment" "ec2_s3" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role       = "${aws_iam_role.ec2.id}"
}

// tag参照用 tag:GetTags とかなってる古いやつはこれで置き換え
// https://docs.aws.amazon.com/ja_jp/IAM/latest/UserGuide/list_tag.html
resource "aws_iam_role_policy_attachment" "ec2_tag" {
  policy_arn = "arn:aws:iam::aws:policy/ResourceGroupsandTagEditorReadOnlyAccess"
  role       = "${aws_iam_role.ec2.id}"
}

// ユーザ管理のポリシーを割り当てる

// https://docs.aws.amazon.com/ja_jp/IAM/latest/UserGuide/list_sns.html
// sns:Publish を置き換えるpolicyドキュメントがないようなのでこれだけこのままつける
resource "aws_iam_role_policy" "ec2" {
  name = "${var.ec2_role_name}"
  role = "${aws_iam_role.ec2.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "sns:Publish"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}
