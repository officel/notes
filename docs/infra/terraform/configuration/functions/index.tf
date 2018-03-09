variable "index_1" {
  type = "list"

  default = [
    "Alpha",
    "Bravo",
    "Charlie",
    "Delta",
    "Echo",
  ]
}

output "index_1" {
  value = "${index(var.index_1, "Charlie")}"
}

output "index_1_element" {
  value = "${element(var.index_1, index(var.index_1, "Delta"))}"
}
