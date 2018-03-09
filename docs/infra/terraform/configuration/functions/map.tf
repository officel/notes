output "map_1" {
  value = "${map("k1","v1")}"
}

output "map_2" {
  value = "${map("k1", "v1", "k2", "v2", "k3", "v3", "k4", "v4")}"
}

output "map_3" {
  value = "${map("list_key_1", list("v1","v2","v3"))}"
}
