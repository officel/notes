# [AWS: aws_iam_user - Terraform by HashiCorp](https://www.terraform.io/docs/providers/aws/r/iam_user.html)

resource "aws_iam_user" "test" {
  name = "test"
  path = "/"
}

resource "aws_iam_user_login_profile" "test" {
  user = "${aws_iam_user.test.name}"
  pgp_key = "keybase:"
  password_reset_required = true
}

resource "aws_iam_user_policy" "test" {
  name = "${aws_iam_user.test.name}-policy"
  user = "${aws_iam_user.test.name}"

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

resource "aws_iam_access_key" "test" {
  user    = "${aws_iam_user.test.name}"
  pgp_key = "keybase:"
}

resource "aws_iam_user_policy_attachment" "test-s3" {
  user       = "${aws_iam_user.test.name}"
  # Provides read only access to all buckets via the AWS Management Console
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}


output "test_password" {
  value = "${aws_iam_user_login_profile.test.encrypted_password}"
}

output "test_encrypted_secret" {
  value = "${aws_iam_access_key.test.encrypted_secret}"
}