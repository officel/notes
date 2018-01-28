variable "list_1_1" {
  default = "list1"
}

variable "list_1_2" {
  default = "list2"
}

variable "list_1_3" {
  default = "list3"
}

output "list_0" {
  value = "${list()}"
}

output "list_1" {
  value = "${list(var.list_1_1, var.list_1_2, var.list_1_3)}"
}

output "list_length_1" {
  value = "${length(list(var.list_1_1, var.list_1_2, var.list_1_3))}"
}

variable "list_length_map" {
  type = "map"

  default = {
    "k1" = "v1"
    "k2" = "v2"
    "k3" = "v3"
    "k4" = "v4"
  }
}

output "list_length_map" {
  value = "${length(var.list_length_map)}"
}

variable "list_length_string" {
  default = "12345"
}

output "list_length_string" {
  value = "${length(var.list_length_string)}"
}
