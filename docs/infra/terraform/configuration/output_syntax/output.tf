output "strings" {
  description = "output value. type string"
  value       = "test value"
}

output "maps" {
  description = "output value. type map"
  value       = {
    key1 = "value1"
    key2 = "value2"
  }
}

output "lists" {
  description = "output value. type list"
  value       = [
    "value1",
    "value2",
    "value3"
  ]
}

// see https://www.terraform.io/docs/configuration/outputs.html#value
// output は、strings, maps, lists のいずれか。bool は使えないので、
// 下記のような例はエラーになる
//output "booleans_true" {
//  description = "output value. type boolean true"
//  value = true
//}
//
//output "booleans_false" {
//  description = "output value. type boolean false"
//  value = false
//}


// 入れ子もできる。が、普通に output すると読みにくい
// terraform output --format=json
// とするとマシになる
// ただ、map の入れ子のつもりが配列のように出力される？
output "nested-maps" {
  value = {
    key1 = {
      key1-1 = {
        key1-1-1 = "value1-1-1"
        key1-1-2 = "value1-1-2"
      }
    }
  }
}


// 下記のように配列の配列にすると直列になるので、上記のmapの入れ子も説明できる？
output "nested-lists" {
  value = [
    [
      [
        "value1-1-1",
        "value1-1-2"
      ],
    ],
    [
      "value1-2",
      "value1-2"
    ],
  ]
}