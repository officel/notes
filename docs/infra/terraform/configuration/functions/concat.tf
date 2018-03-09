variable "concat_1" {
  type = "list"

  default = [
    "0",
    "1",
  ]
}

variable "concat_2" {
  type = "list"

  default = [
    "2",
    "3",
  ]
}

variable "concat_3" {
  type = "list"

  default = [
    "4",
    "5",
  ]
}

output "concat" {
  value = "${concat(var.concat_1, var.concat_2, var.concat_3)}"
}
