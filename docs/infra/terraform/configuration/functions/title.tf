output "title_1" {
  description = "the first characters of all the words capitalized"
  value       = "${title("this is string")}"
}

output "title_2" {
  value = "${title("THIS IS STRING")}"
}

output "title_3" {
  value = "${title("this-is-string")}"
}

output "title_4" {
  value = "${title("hoge+fuga=string")}"
}

output "title_5" {
  value = "${title("hoge1fuga2string")}"
}
