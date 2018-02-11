# https://www.terraform.io/docs/providers/aws/d/canonical_user_id.html

data "aws_canonical_user_id" "current" {}

locals {
  current = {
    id = "${data.aws_canonical_user_id.current.id}"

    // https://docs.aws.amazon.com/ja_jp/general/latest/gr/acct-identifiers.html
    display_name = "${data.aws_canonical_user_id.current.display_name}"
  }
}

output "canonical_user_id" {
  value = "${local.current}"
}
