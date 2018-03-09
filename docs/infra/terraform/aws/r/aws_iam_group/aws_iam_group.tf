# [AWS: aws_iam_group - Terraform by HashiCorp](https://www.terraform.io/docs/providers/aws/r/iam_group.html)
# ファイル名をグループ名にして管理すると楽かも
# グループユーザをterraformの管理下に置かなければ（aws_iam_group_membershipを使わなければ）
# マネジメントコンソール等で追加削除を行ってもterraform側では影響を受けない
# 常にアカウントの状態を管理して、terraformの運用維持が可能であれば管理してもいいけど正直面倒な気がする

resource "aws_iam_group" "developers" {
  name = "developers"
  path = "/"
}

resource "aws_iam_group_policy" "developers" {
  # インラインポリシーは必要な時だけ書けばいい気もする
  name = "developers"
  group = "${aws_iam_group.developers.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:Describe*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

# AWS管理ポリシーがアタッチできる（１グループ10個まで）
resource "aws_iam_group_policy_attachment" "developers_to_admin" {
  group = "${aws_iam_group.developers.name}"
  # Provides full access to AWS services and resources
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_group_policy_attachment" "developers_to_ro" {
  group = "${aws_iam_group.developers.name}"
  # Provides read-only access to AWS services and resources
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}


output "aws_iam_group_developers_arn" {
  value = "${aws_iam_group.developers.arn}"
}
