output "ceil_floor_ceil(4.4)" {
  value = "${ceil(4.4)}"
}

output "ceil_floor_ceil(4.5)" {
  value = "${ceil(4.5)}"
}

output "ceil_floor_floor(4.4)" {
  value = "${floor(4.4)}"
}

output "ceil_floor_floor(4.5)" {
  value = "${floor(4.5)}"
}

// 小数点以下で計算して整数値を求める
// roundは今のところない

output "ceil_floor_ceil(5)" {
  value = "${ceil(5)}"
}

output "ceil_floor_floor(5)" {
  value = "${floor(5)}"
}
