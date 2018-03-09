# Amazon Linux2

packer で作る時はこんな感じでフィルタすると常に最新

```
  "builders": [
    {
      "type":            "amazon-ebs",

      "ssh_username":    "{{user `ssh_username`}}",
      "ssh_timeout":     "{{user `ssh_timeout`}}",

      "region":          "{{user `aws_region`}}",
      "instance_type":   "{{user `aws_instance_type`}}",
      "ami_name":        "{{user `aws_ami_name`}} {{isotime | clean_ami_name}}",
      "ami_description": "{{user `aws_ami_description`}}",
      "associate_public_ip_address": "{{user `aws_pub_ip`}}",

      "source_ami_filter": {
        "filters": {
          "name":                "{{user `filter_name`}}",
          "root-device-type":    "ebs",
          "virtualization-type": "hvm"
        },
        "owners": ["self", "amazon"],
        "most_recent": true
      },
      "tags": {
        "Name": "{{ user `aws_ami_name`}}"
        "SourceAMI": "{{.SourceAMI}}"
      }
    }
  ],

```

## memo

* CentOS7みたい
* amazon-linux-extras というパッケージャ？でいくつかインストールできる
* PHP7.2
* ただし不足パッケージ多い。ちゃんと必要な分埋められるかは不明
* tags に SourceAMI を追加。出来上がったAMIをマネジメントコンソールでリストした時に元にしたAMI IDがわかる（なぜ元々この機能がないの？）
