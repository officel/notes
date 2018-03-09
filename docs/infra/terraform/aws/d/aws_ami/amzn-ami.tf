# [AWS: aws_ami - Terraform by HashiCorp](https://www.terraform.io/docs/providers/aws/d/ami.html)
# [インスタンスタイプマトリックス | AWS](https://aws.amazon.com/jp/amazon-linux-ami/instance-type-matrix/)
# [describe-images — AWS CLI 1.14.23 Command Reference](https://docs.aws.amazon.com/cli/latest/reference/ec2/describe-images.html)

data "aws_ami" "amzn" {
  most_recent = true

  filter {
    name = "name"

    values = [
      "amzn-ami-hvm-*",
    ]

    # AmazonLinux 2 if you want
    # "amzn2-ami-hvm-*"
  }

  filter {
    name = "root-device-type"

    values = [
      "ebs",
    ]
  }

  filter {
    name = "architecture"

    values = [
      "x86_64",
    ]
  }

  filter {
    name = "owner-alias"

    values = [
      "amazon",
    ]
  }

  owners = [
    "amazon",
    "self",
  ]
}

locals {
  ami = {
    architecture          = "${data.aws_ami.amzn.architecture}"
    block_device_mappings = "${data.aws_ami.amzn.block_device_mappings}"
    creation_date         = "${data.aws_ami.amzn.creation_date}"
    description           = "${data.aws_ami.amzn.description}"
    hypervisor            = "${data.aws_ami.amzn.hypervisor}"
    id                    = "${data.aws_ami.amzn.id}"
    image_id              = "${data.aws_ami.amzn.image_id}"
    image_location        = "${data.aws_ami.amzn.image_location}"
    image_owner_alias     = "${data.aws_ami.amzn.image_owner_alias}"
    image_type            = "${data.aws_ami.amzn.image_type}"

    // kernel_id             = "${data.aws_ami.amzn.kernel_id}"

    name     = "${data.aws_ami.amzn.name}"
    owners   = "${data.aws_ami.amzn.owners}"
    owner_id = "${data.aws_ami.amzn.owner_id}"

    // platform      = "${data.aws_ami.amzn.platform}"

    product_codes = "${data.aws_ami.amzn.product_codes}"
    public        = "${data.aws_ami.amzn.public}"

    // ramdisk_id            = "${data.aws_ami.amzn.ramdisk_id}"

    root_device_name    = "${data.aws_ami.amzn.root_device_name}"
    root_device_type    = "${data.aws_ami.amzn.root_device_type}"
    root_snapshot_id    = "${data.aws_ami.amzn.root_snapshot_id}"
    sriov_net_support   = "${data.aws_ami.amzn.sriov_net_support}"
    state               = "${data.aws_ami.amzn.state}"
    state_reason        = "${data.aws_ami.amzn.state_reason}"
    tags                = "${data.aws_ami.amzn.tags}"
    virtualization_type = "${data.aws_ami.amzn.virtualization_type}"
  }
}

output "aws_ami_amzn_image_id" {
  description = "コメントされたものはデータソース中で存在しないと参照エラーになる"
  value       = "${local.ami}"
}
