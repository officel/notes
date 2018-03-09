# CloudTrail

[AWS CloudTrail ドキュメント](https://aws.amazon.com/jp/documentation/cloudtrail/)

* 大雑把にはAWSでの作業（API呼び出し）が記録される
* アカウント作成時に自動で有効
* 従来のユーザによる作成も有効
* [AWS CloudTrailはデフォルトとユーザー作成で何が違う? ｜ Developers.IO](https://dev.classmethod.jp/cloud/aws/aws-cloudtrail-default-vs-custom/)
* デフォルト設定では管理イベントアクティビティのみ、7日のみ（今は90日？）、コンソールで確認可能、ここまでは無料
* ユーザ作成による証跡はS3バケットやデータ量、イベントの量に応じて有料。よほどでない限り数ドル程度なので設定しておくべき
* 可視化には TrailDash などがあったが、[CloudWatch Logs Subscription Consumer + Elasticsearch + Kibana Dashboards | AWS News Blog](https://aws.amazon.com/jp/blogs/aws/cloudwatch-logs-subscription-consumer-elasticsearch-kibana-dashboards/)の説明により開発が終了している
* 単純に ElasticSearch Service 使ったほうが早い気がしているが未検証
