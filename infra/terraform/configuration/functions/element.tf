variable "element" {
  description = "Returns a single element from a list at the given index"
  type        = "list"

  default = [
    "elem0",
    "elem1",
    "elem2",
  ]
}

output "element_1" {
  value = "${element(var.element, 1)}"
}
