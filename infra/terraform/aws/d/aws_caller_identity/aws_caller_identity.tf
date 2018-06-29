data "aws_caller_identity" "current" {}

// https://docs.aws.amazon.com/ja_jp/IAM/latest/UserGuide/reference_policies_variables.html#principaltable

locals {
  caller = {
    // AWS Account ID
    account_id = "${data.aws_caller_identity.current.account_id}"

    // 呼び出したアカウントの arn
    caller_arn = "${data.aws_caller_identity.current.arn}"

    // 呼び出したアカウントの一意な値（上記URLのテーブルの一意な値のリンク先を参照）
    caller_user = "${data.aws_caller_identity.current.user_id}"
  }
}

output "caller" {
  value = "${local.caller}"
}
