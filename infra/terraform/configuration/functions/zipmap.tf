variable "zipmap_key_1" {
  type = "list"

  default = [
    "k1",
    "k2",
    "k3",
  ]
}

variable "zipmap_value_1" {
  type = "list"

  default = [
    "v1",
    "v2",
    "v3",
  ]
}

output "zipmap_1" {
  value = "${zipmap(var.zipmap_key_1, var.zipmap_value_1)}"
}
