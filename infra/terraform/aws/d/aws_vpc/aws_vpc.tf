# [AWS: aws_vpc - Terraform by HashiCorp](https://www.terraform.io/docs/providers/aws/d/vpc.html)

data "aws_vpc" "selected" {
  filter {
    name = "tag:Name"
    values = [
      ""
    ]
  }
}

output "aws_vpc_id" {
  value = "${data.aws_vpc.selected.id}"
}

# tag:Name が空白でも検索可
# 検索結果が一意にならないとエラー。０個でもエラー。
# ドキュメントの例のようにIDで検索するのでは利用価値がないかも？
# 外部ステートを取り込むよりも所定の条件で絞ってdataリソースを使うほうが再利用性が高いと思う
# VPCに適切なNameを付けて扱えば便利
