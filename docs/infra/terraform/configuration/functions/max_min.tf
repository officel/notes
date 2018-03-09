variable "max_min_1_1" {
  default = 1.1
}

variable "max_min_1_2" {
  default = 1.2
}

variable "max_min_1_12" {
  default = 1.12
}

variable "max_min_1_21" {
  default = 1.21
}

output "max_min_max_is" {
  value = "${max(var.max_min_1_1, var.max_min_1_2, var.max_min_1_12, var.max_min_1_21)}"
}

output "max_min_min_is" {
  value = "${min(var.max_min_1_1, var.max_min_1_2, var.max_min_1_12, var.max_min_1_21)}"
}

locals {
  max_min_max_awesome = "${max(
    var.max_min_1_1,
    var.max_min_1_2,
    var.max_min_1_12,
    var.max_min_1_21
  )}"

  max_min_min_awesome = "${min(
    var.max_min_1_1,
    var.max_min_1_2,
    var.max_min_1_12,
    var.max_min_1_21
  )}"
}

output "max_min_max_awesome" {
  value = "${local.max_min_max_awesome }"
}

output "max_min_min_awesome" {
  value = "${local.max_min_min_awesome }"
}
