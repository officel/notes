// locals example
// I know that this is not functions.
locals {
  variables = {
    string = "this is string"

    list = [
      "li-1",
      "li-2",
      "li-3",
    ]

    map = {
      k1 = "v1"
      k2 = "v2"
      k3 = "v3"
    }
  }
}

output "locals_variables_1" {
  value = "${local.variables}"
}

output "locals_variables_get_map" {
  value = "@todo how to access local.variables.map.k1"
}
