variable "transpose" {
  type = "map"

  default = {
    "a" = [
      "1",
      "2",
    ]

    "b" = [
      "2",
      "3",
    ]
  }
}

// 使用用途がいまいちわかっていない

output "transpose" {
  value = "${transpose(var.transpose)}"
}
