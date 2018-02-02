output "basename_1" {
  description = "他言語の関数と同じようにPATH情報的な文字列から最後の部分を取り出す"
  value       = "${basename("/var/log/nginx/access_log")}"
}

output "basename_2" {
  description = "末尾の / は除去される"
  value       = "${basename("/var/log/nginx/")}"
}

// goでの実装は path.Base() の戻り値なので

output "basename_current" {
  description = "空の場合は . が返る"
  value       = "${basename("")}"
}

output "basename_slash" {
  description = "スラッシュだけの場合は / が返る"
  value       = "${basename("/")}"
}
