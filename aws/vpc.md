# vpc

* [Amazon Virtual Private Cloud（VPC）ドキュメント | AWS](https://aws.amazon.com/jp/documentation/vpc/)
* [terraform-aws-modules/terraform-aws-vpc: Terraform module which creates VPC resources on AWS](https://github.com/terraform-aws-modules/terraform-aws-vpc)

    * github に terraform モジュールがあるので活用する
    * 今のところこのモジュールで困っていない
    * [AWS: aws_availability_zones - Terraform by HashiCorp](https://www.terraform.io/docs/providers/aws/d/availability_zones.html)
    * アベイラビリティゾーンを指定するデータソースがあるのでリテラルで指定しなくていい（てゆうか、モジュールの例を挙げる時に最初から書いてあればいいのに）

* 2017のアップデートでリージョン間のVPCピアリングか格段に作りやすくなった（インターリージョンVPCピアリング）

    * [AWS: aws_vpc_peering_connection - Terraform by HashiCorp](https://www.terraform.io/docs/providers/aws/r/vpc_peering.html)
    * 自アカウント内でのピアリングは peer_vpc_id, vpc_id, auto_accept で済む

* ピアリングやダイレクトコネクトでオンプレや他環境とバッティングしないようにネットワーク設計すること
* アカウント全体のネットワークを /16 で確定し、/18 ないし /19 で VPC を分離して、 /24 のサブネットにするのが今のところ使い勝手がよい
* アカウント作成時に各リージョンに作成されるデフォルトVPCにはなるべく手をつけないほうが楽
* ネットワークコンポーネントは数が多く、一度に覚えるのは難しいので少しずつ覚える
* VPC は制限が早い（１リージョン５つまで）ので、環境毎にVPCを分ける設計にするなら制限解除依頼
