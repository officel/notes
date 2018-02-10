# [AWS: aws_billing_service_account - Terraform by HashiCorp](https://www.terraform.io/docs/providers/aws/d/billing_service_account.html)

data "aws_billing_service_account" "this" {}

locals {
  billing = {
    id  = "${data.aws_billing_service_account.this.id}"
    arn = "${data.aws_billing_service_account.this.arn}"
  }
}

output "aws_billing_service_account_this" {
  value = "${local.billing}"
}
