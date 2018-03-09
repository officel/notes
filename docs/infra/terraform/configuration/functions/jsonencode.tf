// see locals.tf
output "jsonencode_from_locals_variables" {
  value = "${jsonencode(local.variables)}"
}
