# [AWS: aws_iam_policy_document - Terraform by HashiCorp](https://www.terraform.io/docs/providers/aws/d/iam_policy_document.html)

# 既存のIAM_Policyを探すのではなくて、policy.json を組み立てるためのデータソース
# 出力させる .json を aws_iam_policy リソースの policy として渡せる
# policy.json が大味で、固定のファイルでいいなら出来上がっているファイルを使う
# ヒアドキュメントで aws_iam_user_policy に直接書くのはサンプルではいいけど？
# このサンプルのように、変数を与えて必要な展開を行うような場合はこちらを使う

variable "s3_bucket_name" {
  default = "*"
}

data "aws_iam_policy_document" "this" {
  statement {
    sid       = "1"

    actions   = [
      "s3:ListAllMyBuckets",
      "s3:GetBucketLocation",
    ]

    resources = [
      "arn:aws:s3:::*",
    ]
  }

  statement {
    actions   = [
      "s3:ListBucket",
    ]

    resources = [
      "arn:aws:s3:::${var.s3_bucket_name}",
    ]

    condition {
      test     = "StringLike"
      variable = "s3:prefix"

      values   = [
        "",
        "home/",
        "home/&{aws:username}/",
      ]
    }
  }

  statement {
    actions   = [
      "s3:*",
    ]

    resources = [
      "arn:aws:s3:::${var.s3_bucket_name}/home/&{aws:username}",
      "arn:aws:s3:::${var.s3_bucket_name}/home/&{aws:username}/*",
    ]
  }
}

output "iam_policy_document" {
  value = "${data.aws_iam_policy_document.this.json}"
}

