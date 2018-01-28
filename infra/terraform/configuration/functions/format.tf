output "format" {
  value = "${format("%04d/%02d/%02d", 2018, 1, 1)}"
}

output "format_base_2" {
  description = "base 2. maybe return 1010"
  value       = "${format("%b", 10)}"
}

output "format_base_8" {
  description = "base 8. maybe return 12"
  value       = "${format("%o", 10)}"
}

output "format_base16_l" {
  description = "base 16. maybe return ff"
  value       = "${format("%x", 255)}"
}

output "format_base16_u" {
  description = "base 16. maybe return FF"
  value       = "${format("%X", 255)}"
}
