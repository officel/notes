# [AWS: aws_ami - Terraform by HashiCorp](https://www.terraform.io/docs/providers/aws/d/ami.html)
# [インスタンスタイプマトリックス | AWS](https://aws.amazon.com/jp/amazon-linux-ami/instance-type-matrix/)
# [describe-images — AWS CLI 1.14.23 Command Reference](https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-images.html)

data "aws_ami" "amzn" {
  most_recent = true

  filter {
    name = "name"
    values = [
      "amzn-ami-hvm-*"
      # AmazonLinux 2 if you want
      # "amzn2-ami-hvm-*"
    ]
  }
  filter {
    name = "root-device-type"
    values = [
      "ebs"
    ]
  }

  filter {
    name = "architecture"
    values = [
      "x86_64"
    ]
  }

  filter {
    name = "owner-alias"
    values = [
      "amazon"
    ]
  }

  owners = [
    "amazon",
    "self"
  ]
}

output "aws_ami_amzn_image_id" {
  value = "${data.aws_ami.amzn.image_id}"
}
