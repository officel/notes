locals {
  matchkeys_values = [
    "v1",
    "v2",
    "v3",
  ]

  matchkeys_keys = [
    "k1",
    "k2",
    "k3",
  ]
}

output "matchkeys_k2" {
  value = "${matchkeys(local.matchkeys_values, local.matchkeys_keys, list("k2"))}"
}
