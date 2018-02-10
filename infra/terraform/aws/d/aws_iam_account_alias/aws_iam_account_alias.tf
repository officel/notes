# https://www.terraform.io/docs/providers/aws/d/iam_account_alias.html

data "aws_iam_account_alias" "current" {}

output "account_id" {
  decription = "使用しているAWSアカウント（IAMじゃなくて）のエイリアス。ただし使いどころがわからない"
  value = "${data.aws_iam_account_alias.current.account_alias}"
}
