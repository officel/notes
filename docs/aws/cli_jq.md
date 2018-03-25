# cli with jq

* カテゴリは[AWS Documentation](https://aws.amazon.com/documentation/?nc1=h_ls)にあわせる
* VPCのように複数のカテゴリに出現するものは先のカテゴリにいれる
* NatGateway のようにカテゴリにもサービスとしても独立していないものはなるべくわかりやすい位置にいれる。EC2 のサブコマンドになっているが、VPCと関連が高いのでVPCの下におくなど
* 頻繁に更新されるので、ゆるゆると追従予定
* jqのページも参照

## Compute

### Amazon EC2
```
# インスタンスID
export instance_id=`curl -s http://169.254.169.254/latest/meta-data/instance-id`

# インスタンス情報
export ec2=`aws ec2 describe-instances --instance-id $instance_id`

# プライベートIP
echo $ec2 | jq -r '.Reservations[].Instances[].PrivateIpAddress'

# タグ
echo $ec2 | jq -r '.Reservations[].Instances[].Tags[]'

# 指定のキーの値
echo $ec2 | jq -r '.Reservations[].Instances[].Tags[] | select(.Key == "Project") | .Value'

```

### Amazon VPC

```
# VPC の一覧（Nameも）
aws ec2 describe-vpcs | jq -r '.Vpcs[] | .VpcId, (.Tags[] | select(.Key == "Name") | .Value)'

# Tags については from_entries を使うとタイプ数が減る
aws ec2 describe-vpcs | jq -r '.Vpcs[] | .VpcId, (.Tags | from_entries | .Name)'

# 特定のVPCのsubnetをリスト
aws ec2 describe-subnets | jq -r '.Subnets[] | select(.VpcId == "$VpcId") | (.Tags | from_entries | .Name), .CidrBlock'

```

### AWS NatGateway

```
# 特定のVPCのNatGatewayをリスト
aws ec2 describe-nat-gateways | jq -r '.NatGateways[] | select(.VpcId == "$VpcId") | .NatGatewayAddresses, (.Tags|from_entries|.Name)'
```


## Storage

## Database

## Migration

## Networking & Content Delivery

### AWS Route53

```
# zone をリスト
aws route53 list-hosted-zones | jq -r '.HostedZones[].Name | rtrimstr(".")' | more

# Private zone をリスト
aws route53 list-hosted-zones | jq -r '.HostedZones[] | select(.Config.PrivateZone == true) | .Name | rtrimstr(".")'

# PrivateDNS と VPC の関連を取得したいけど、リストから取得する方法がわからない
aws route53 get-hosted-zone --id $HostedZoneId | jq -r '.VPCs[].VPCId'
```


## Developer Tools

## Management Tools

## Media Services

## Machine Learning

## Analytics

## Security, Identity, & Compliance

## Mobile Services

## AR & VR

## Application Integration

## Customer Engagement

## Business Productivity

## Desktop & App Streaming

## Internet of Things

## Game Development

## SDKs & Toolkits

## Additional Software & Services

## General Reference

## AWS Management Console

## Resources
