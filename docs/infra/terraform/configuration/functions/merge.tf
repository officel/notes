variable "merge_1" {
  type = "map"

  default = {
    k1 = "v1"
    k2 = "v2"
  }
}

variable "merge_2" {
  type = "map"

  default = {
    k3 = "v3"
    k2 = "v2 overwrite"
  }
}

// マージの順序大事。後勝ち。

locals {
  merge_1_2 = "${merge(var.merge_1, var.merge_2)}"
  merge_2_1 = "${merge(var.merge_2, var.merge_1)}"
}

output "merge_1_2" {
  value = "${local.merge_1_2}"
}

output "merge_2_1" {
  value = "${local.merge_2_1}"
}
