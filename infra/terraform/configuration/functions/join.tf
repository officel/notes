variable "join_1" {
  type = "list"

  default = [
    "text1",
    "text2",
    "text3",
  ]
}

output "join_1" {
  value = "${join("-",var.join_1)}"
}

variable "join_2_1" {
  default = "text1"
}

variable "join_2_2" {
  default = "text2"
}

variable "join_2_3" {
  default = "text3"
}

locals {
  join_2 = [
    "${var.join_2_1}",
    "${var.join_2_2}",
    "${var.join_2_3}",
  ]
}

output "join_2" {
  value = "${join("-", local.join_2)}"
}
