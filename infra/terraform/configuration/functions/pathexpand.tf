variable "pathexpand" {
  default = "~/.bachrc"
}

locals {
  pathexpand = {
    basename   = "${basename(var.pathexpand)}"
    dirname    = "${dirname(var.pathexpand)}"
    pathexpand = "${pathexpand(var.pathexpand)}"
    z          = "${dirname(pathexpand(var.pathexpand))}"
  }
}

output "pathexpand" {
  value = "${local.pathexpand}"
}
