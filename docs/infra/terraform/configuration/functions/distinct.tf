variable "distinct" {
  description = "a.k.a. KONAMI Command"
  type        = "list"

  default = [
    "up",
    "up",
    "down",
    "down",
    "left",
    "right",
    "left",
    "right",
    "a",
    "b",
  ]
}

output "distinct_konami_command" {
  value = "${distinct(var.distinct)}"
}
