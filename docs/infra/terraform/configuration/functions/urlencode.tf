variable "urlencode_1" {
  default = "http://example.com/?a=1&b=2"
}

output "urlencode_0" {
  description = "nothing todo."
  value       = "${var.urlencode_1}"
}

output "urlencode_1" {
  description = "url encode string"
  value       = "${urlencode(var.urlencode_1)}"
}
