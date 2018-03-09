output "dirname_1" {
  description = "他言語の関数と同じようにPATH情報的な文字列からパス部分を取り出す"
  value       = "${dirname("/var/log/nginx/access_log")}"
}

output "dirname_2" {
  description = "末尾の / 以降が除去される感じ"
  value       = "${dirname("/var/log/nginx/")}"
}

// goでの実装は path/filepath.Dir() の戻り値なので

output "dirname_current" {
  description = "空の場合は . が返る"
  value       = "${dirname("")}"
}

output "dirname_slash" {
  description = "スラッシュだけの場合は / が返る"
  value       = "${dirname("/")}"
}
