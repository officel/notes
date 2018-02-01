variable "coalesce_1" {
  default = ""
}

variable "coalesce_2" {
  default = ""
}

variable "coalesce_3" {
  default = "ok"
}

output "coaleace" {
  value = "${coalesce(var.coalesce_1, var.coalesce_2, var.coalesce_3)}"
}

variable "coalescelist_1" {
  type    = "list"
  default = []
}

variable "coalescelist_2" {
  type = "list"

  default = [
    "ok",
    "ok1"
  ]
}

variable "coalescelist_3" {
  type    = "list"
  default = []
}

output "coaleacelist" {
  value = "${coalescelist(var.coalescelist_1, var.coalescelist_2, var.coalescelist_3)}"
}
