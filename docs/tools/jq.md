# jq

* [jq](https://stedolan.github.io/jq/)
* json 形式のデータをフィルタして加工するツール
* ドキュメントを読めばわかることはパス
* aws 下の cli_jq に書いたものを移した

## メモ

```
# Tags については from_entries を使うとタイプ数が減る。丸括弧内をイディオムとして使う
aws ec2 describe-vpcs | jq -r '.Vpcs[] | .VpcId, (.Tags | from_entries | .Name)'

# 横に並べて表示（改行しない）については -c -r @tsv を併用すると楽
aws ec2 describe-instances --region ap-northeast-1 | jq -c -r '.Reservations[].Instances[] | [.Placement.AvailabilityZone, .State.Name, .InstanceId] | @tsv'

```
