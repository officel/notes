# jq

* [jq](https://stedolan.github.io/jq/)
* json 形式のデータをフィルタして加工するツール
* ドキュメントを読めばわかることはパス

## 書いた

### AWS EC2
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

### AWS Route53

```
# zone をリスト
aws route53 list-hosted-zones | jq -r '.HostedZones[].Name | rtrimstr(".")' | more

# Private zone をリスト
aws route53 list-hosted-zones | jq -r '.HostedZones[] | select(.Config.PrivateZone == true) | .Name | rtrimstr(".")'

# PrivateDNS と VPC の関連を取得したいけど、リストから取得する方法がわからない
aws route53 get-hosted-zone --id $HostedZoneId | jq -r '.VPCs[].VPCId'
```

### AWS VPC

```
# VPC の一覧（Nameも）
aws ec2 describe-vpcs | jq -r '.Vpcs[] | .VpcId, (.Tags[] | select(.Key == "Name") | .Value)'

# Tags については from_entries を使うとタイプ数が減る
aws ec2 describe-vpcs | jq -r '.Vpcs[] | .VpcId, (.Tags | from_entries | .Name)'
```

※ from_entries https://stedolan.github.io/jq/manual/#Builtinoperatorsandfunctions

### AWS VPC Subnet

```
# 特定のVPCのsubnetをリスト
aws ec2 describe-subnets | jq -r '.Subnets[] | select(.VpcId == "$VpcId") | (.Tags | from_entries | .Name), .CidrBlock'
```

### AWS NatGateway

```
# 特定のVPCのNatGatewayをリスト
aws ec2 describe-nat-gateways | jq -r '.NatGateways[] | select(.VpcId == "$VpcId") | .NatGatewayAddresses, (.Tags|from_entries|.Name)'
```
