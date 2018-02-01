variable "lookup_1" {
  type = "map"

  default = {
    k1 = "v1"
    k2 = "v2"
    k3 = "v3"
    k4 = "v4"
  }
}

output "lookup_1" {
  value = "${lookup(var.lookup_1, "k1", "not found")}"
}

output "lookup_1_default" {
  value = "${lookup(var.lookup_1, "v1", "not found")}"
}
