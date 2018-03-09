variable "compact_1" {
  type = "list"

  default = [
    0,
    1,
    "",
    3,
    " ",
    5,
  ]
}

output "compact_1" {
  // 空文字""だけ詰めることができる。" "は詰めない（空白文字として文字列ということ）
  // 定数のようにnullみたいなのは使えないんだっけ？（エラーになる
  value = "${compact(var.compact_1)}"
}
