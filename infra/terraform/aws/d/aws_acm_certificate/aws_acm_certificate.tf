# https://www.terraform.io/docs/providers/aws/d/acm_certificate.html

provider "aws" {
  region = "${var.region}"
}

variable "region" {
  description = "acm region"
}

variable "domain" {
  description = "domain name. example.com, *.example.com, *.www.example.com"
}

variable "acm_status" {
  description = "Valid values are PENDING_VALIDATION, ISSUED, INACTIVE, EXPIRED, VALIDATION_TIMED_OUT, REVOKED and FAILED"
  type        = "list"

  default = [
    "PENDING_VALIDATION",
    "ISSUED",
  ]
}

data "aws_acm_certificate" "this" {
  domain   = "${var.domain}"
  statuses = "${var.acm_status}"
}

output "aws_acm_certificate" {
  value = "${data.aws_acm_certificate.this.arn}"
}
