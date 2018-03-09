// 使い道はわからないけど、output の名前に括弧やカンマが使えることに気が付いた
output "log(100,10)" {
  value = "${log(100, 10)}"
}

output "log(8,2)" {
  value = "${log(8, 2)}"
}
