# [AWS: aws_billing_service_account - Terraform by HashiCorp](https://www.terraform.io/docs/providers/aws/d/billing_service_account.html)

data "aws_billing_service_account" "main" {}

output "aws_billing_service_account_arn" {
  value = "${data.aws_billing_service_account.main.arn}"
}
