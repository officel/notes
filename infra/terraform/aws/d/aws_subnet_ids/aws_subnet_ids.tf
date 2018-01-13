# [AWS: aws_subnet_ids - Terraform by HashiCorp](https://www.terraform.io/docs/providers/aws/d/subnet_ids.html)

data "aws_vpc" "selected" {
  filter {
    name = "tag:Name"
    values = [
      ""
    ]
  }
}

data "aws_subnet_ids" "selected" {
  vpc_id = "${data.aws_vpc.selected.id}"
  tags {
    Name = ""
  }
}

output "aws_subnet_ids" {
  value = "${data.aws_subnet_ids.selected.ids}"
}

# 特定のVPCの特定のsubnetをリストする
# 具体的には本番環境のパブリックサブネットだけリストするとか
# Name tag に適切に名前をつけるとか、Env, Tier など適切なタグをつけておくのが大事
# このサンプルで示すとおり、VPCはfilterでNameが空でも検索できるが、
# subnet_ids はtagsで、Name が空のものは検索できないようだ（エラーになる）
# 別途subnetに名前を付けると検索できるようになるので、やはりタグ付けは重要
