# [AWS: aws_subnet_ids - Terraform by HashiCorp](https://www.terraform.io/docs/providers/aws/d/subnet_ids.html)

data "aws_vpc" "selected" {
  default = true
}

data "aws_subnet_ids" "selected" {
  vpc_id = "${data.aws_vpc.selected.id}"
  tags   = {}
}

output "aws_subnet_ids" {
  value = "${data.aws_subnet_ids.selected.ids}"
}

# 特定のVPCの特定のsubnetをリストする
# 具体的には本番環境のパブリックサブネットだけリストするとか
# Name tag に適切に名前をつけるとか、Env, Tier など適切なタグをつけておくのが大事
# このサンプルで示すとおり、VPCはfilterでNameが空でも検索できるが、＜誤り
# subnet_ids はtagsで、Name が空のものは検索できないようだ（エラーになる）
# VPCもsubnetも別途タグを保存するなどしないと、空で検索はできない（空で保存すると検索できるようになる）
# 別途subnetに名前を付けると検索できるようになるので、やはりタグ付けは重要

