// abs() は絶対値が返る
output "abs_0" {
  value = "${abs(0)}"
}

output "abs_1_minus" {
  value = "${abs(-1)}"
}

output "abs_1_plus" {
  value = "${abs(1)}"
}

output "abs_pi_minus" {
  value = "${abs(-3.1416)}"
}

output "abs_pi_plus" {
  value = "${abs(3.1416)}"
}

// signum() は負数は-1、0は0、正数は1を返す
output "abs_signum_0" {
  value = "${signum(0)}"

  // return 0
}

output "abs_signum_1_minus" {
  value = "${signum(-1)}"

  // return -1
}

output "abs_signum_1_plus" {
  value = "${signum(1)}"

  // return 1
}

output "abs_signum_10_plus" {
  value = "${signum(10)}"

  // return 1
}

// signum() の例
// https://github.com/hashicorp/terraform/issues/4853

