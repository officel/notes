# 使いどころを選ぶけど入れ子ループのサンプルとして
# ※VPC Peeringで使用した

variable "asc" {
  type = "list"

  default = [
    "a",
    "b",
    "c",
    "d",
  ]
}

variable "desc" {
  type = "list"

  default = [
    "z",
    "y",
    "x",
  ]
}

// want
// a_z, a_y, a_x,
// b_z, b_y, b_x,
// c_z, c_y, c_x,
// d_z, d_y, d_x

locals {
  counter = {
    asc  = "${length(var.asc)}"
    desc = "${length(var.desc)}"
  }
}

// 要諦はasc(4)*desc(3)=count(12), index/asc(4)の余りとindex/asc(4)
resource "local_file" "foo" {
  count    = "${local.counter["asc"] * local.counter["desc"]}"
  content  = "ok"
  filename = "${path.module}/file_${var.asc[count.index % local.counter["asc"]]}-${var.desc[count.index / local.counter["asc"]]}.txt"
}
