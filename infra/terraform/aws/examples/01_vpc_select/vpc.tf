# vpc_id を入力した場合は採用し、入力しない場合はデフォルトVPCを採用する

variable "vpc_id" {
  description = "use vpc_id"
  default     = ""
}

locals {
  user_vpc_count = "${var.vpc_id == "" ? 0 : 1}"
  vpc_id         = "${local.user_vpc_count == 0 ? data.aws_vpc.default.id : var.vpc_id}"
}

// ユーザ指定の vpc_id が使えない場合はこのデータソースがエラーになる
// 正常の場合は var.vpc_id の値は正常な値ということ
data "aws_vpc" "user" {
  count = "${local.user_vpc_count}"
  id    = "${var.vpc_id}"
}

// デフォルトVPCは概ねあるはず（一部除く）
data "aws_vpc" "default" {
  default = true
}

output "aws_vpc.default.id" {
  value = "${data.aws_vpc.default.id}"
}

// コード側ではこれを利用すれば問題ない
data "aws_vpc" "use" {
  id = "${local.vpc_id}"
}

output "aws_vpc.use" {
  value = "${data.aws_vpc.use.id}"
}
