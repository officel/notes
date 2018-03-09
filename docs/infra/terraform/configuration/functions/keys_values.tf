variable "keys_values_1" {
  type = "map"

  default = {
    "key_2"  = "value_2"
    "key_10" = "value_10"
    "key_09" = "value_09"
    "key_01" = "value_01"
    "key_02" = "value_02"
    "key_03" = "value_03"
    "key_1"  = "value_1"
  }
}

output "keys_values_keys_1" {
  value = "${keys(var.keys_values_1)}"
}

output "keys_values_values_1" {
  value = "${values(var.keys_values_1)}"
}
