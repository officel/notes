variable "contains" {
  type = "list"

  default = [
    "strings",
    "list",
    "map",
  ]
}

output "contains_true" {
  value = "${contains(var.contains, "list")}"
}

output "contains_false" {
  value = "${contains(var.contains, "dictionary")}"
}
