# cli with jq

* カテゴリは[AWS Documentation](https://aws.amazon.com/documentation/?nc1=h_ls)にあわせる
* VPCのように複数のカテゴリに出現するものは先のカテゴリにいれる
* NatGateway のようにカテゴリにもサービスとしても独立していないものはなるべくわかりやすい位置にいれる。EC2 のサブコマンドになっているが、VPCと関連が高いのでVPCの下におくなど
* 頻繁に更新されるので、ゆるゆると追従予定
* jqのページも参照

## Compute

### Amazon EC2

#### インスタンスID

    INSTANCE_ID=`curl -s http://169.254.169.254/latest/meta-data/instance-id`

#### インスタンス情報

    INSTANCE_DATA=`aws ec2 describe-instances --instance-id $INSTANCE_ID`

#### プライベートIP

    PRIVATE_IPV4=`echo $INSTANCE_DATA | jq -r '.Reservations[].Instances[].PrivateIpAddress'`

#### タグ（全て）

    echo $INSTANCE_DATA | jq -r '.Reservations[].Instances[].Tags[]'

#### タグ（指定のキーの値）

    echo $INSTANCE_DATA | jq -r '.Reservations[].Instances[].Tags[] | select(.Key == "Project") | .Value'

#### タグ（指定のキーの値（改））

    echo $INSTANCE_DATA | jq -r '.Reservations[].Instances[] | (.Tags | from_entries | .Project)'

#### Project タグ

    TAG_PROJECT=`echo $INSTANCE_DATA | jq -r '.Reservations[].Instances[] | (.Tags | from_entries | .Project)'`

#### Environment タグ

    TAG_ENVIRONMENT=`echo $INSTANCE_DATA | jq -r '.Reservations[].Instances[] | (.Tags | from_entries | .Environment)'`

#### Region の一覧

    aws ec2 describe-regions | jq -r '.Regions | sort_by(.RegionName)[].RegionName'

#### リージョン内のEC2のリスト

-c で改行しないコンパクト表示、-r でダブルクォーテーションをつけない、@tsv で TSV出力

    aws ec2 describe-instances --region ap-northeast-1 | jq -c -r '.Reservations[].Instances[] | [.Placement.AvailabilityZone, .State.Name, .InstanceId, (.Tags[] | select(.Key=="Name").Value)] | @tsv'


### Amazon VPC

#### VPC の一覧（Nameも）

    aws ec2 describe-vpcs | jq -r '.Vpcs[] | .VpcId, (.Tags[] | select(.Key == "Name") | .Value)'

#### Tags については from_entries を使うとタイプ数が減る

    aws ec2 describe-vpcs | jq -r '.Vpcs[] | .VpcId, (.Tags | from_entries | .Name)'

#### 特定のVPCのsubnetをリスト

    aws ec2 describe-subnets | jq -r '.Subnets[] | select(.VpcId == "$VpcId") | (.Tags | from_entries | .Name), .CidrBlock'


### AWS NatGateway

#### 特定のVPCのNatGatewayをリスト

    aws ec2 describe-nat-gateways | jq -r '.NatGateways[] | select(.VpcId == "$VpcId") | .NatGatewayAddresses, (.Tags|from_entries|.Name)'


## Storage

## Database

## Migration

## Networking & Content Delivery

### Amazon CloudFront

#### ディストリビューションをリスト

    aws cloudfront list-distributions | jq -r '.DistributionList.Items[] | .Id'

#### 特定のエイリアスのディストリビューションを取得（[0]をやめたい。。。）

    aws cloudfront list-distributions | jq -r '.DistributionList.Items[] | select(.Aliases.Items[0] == "example.com")   | .Id'

### AWS Route53

#### zone をリスト

    aws route53 list-hosted-zones | jq -r '.HostedZones[].Name | rtrimstr(".")' | more

#### Private zone をリスト

    aws route53 list-hosted-zones | jq -r '.HostedZones[] | select(.Config.PrivateZone == true) | .Name | rtrimstr(".")'

#### PrivateDNS と VPC の関連を取得したいけど、リストから取得する方法がわからない

    aws route53 get-hosted-zone --id $HostedZoneId | jq -r '.VPCs[].VPCId'


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

### Amazon SES

#### リージョンを指定（対応リージョン注意）


    export AWS_DEFAULT_REGION=us-east-1

    domain=DOMAIN

    aws ses verify-domain-identity --domain $domain

    aws ses list-identities

    aws ses get-identity-verification-attributes --identities $domain
    
    aws ses get-identity-mail-from-domain-attributes --identities $domain


## Business Productivity

## Desktop & App Streaming

## Internet of Things

## Game Development

## SDKs & Toolkits

## Additional Software & Services

## General Reference

## AWS Management Console

## Resources
