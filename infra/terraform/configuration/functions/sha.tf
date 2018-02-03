variable "sha_string" {
  default = "test"
}

locals {
  sha = {
    string = "${var.sha_string}"
    sha1   = "${sha1(var.sha_string)}"
    sha256 = "${sha256(var.sha_string)}"
    sha512 = "${sha512(var.sha_string)}"
  }
}

output "sha" {
  value = "${local.sha}"
}

// 個別取り出しOK
//output "sha.sha256" {
//  value = "${local.sha["sha256"]}"
//}
