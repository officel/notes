variable "sort_list_strings" {
  type = "list"

  default = [
    "01",
    "0",
    "10.0",
    "100",
    "10",
    "1",
    "1.1",
  ]
}

locals {
  sort = "${sort(var.sort_list_strings)}"
}

output "sort" {
  value = "${local.sort}"
}
