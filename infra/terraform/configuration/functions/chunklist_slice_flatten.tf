variable "chunklist" {
  type = "list"

  default = [
    "v1",
    "v2",
    "v3",
    "v4",
    "v5",
    "v6",
    "v7",
    "v8",
  ]
}

output "chunklist" {
  value = "${chunklist(var.chunklist, 2)}"
}

output "chunklist_slice_0" {
  value = "${slice(chunklist(var.chunklist, 2), 0, 1) }"
}

output "chunklist_slice_3" {
  value = "${slice(chunklist(var.chunklist, 2), 3, 4) }"
}

output "chunklist_slice_flatten" {
  value = "${flatten(slice(chunklist(var.chunklist, 2), 0, 1)) }"
}
