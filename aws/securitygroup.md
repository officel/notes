# security group

* [VPC のセキュリティグループ - Amazon Virtual Private Cloud](https://docs.aws.amazon.com/ja_jp/AmazonVPC/latest/UserGuide/VPC_SecurityGroups.html)
* [Linux インスタンスの Amazon EC2 セキュリティグループ - Amazon Elastic Compute Cloud](https://docs.aws.amazon.com/ja_jp/AWSEC2/latest/UserGuide/using-network-security.html)
* セキュリティグループは許可制
* 緩く許可すると閉められないので、必要な分だけ開く
* インスタンス起動時にVPCのデフォルトセキュリティグループを付けておけばその範囲内で通信できる（デフォルトセキュリティグループに自身のグループ間通信が設定してある）
* 外部からの接続を許可するグループは用途に合わせて作成し、必要に応じて設定する。デフォルトセキュリティグループに大穴を開けると大変

    * web(80,8080,443) を 0.0.0.0/0
    * ssh(22)をレンジを絞るか固定IPで

* terraform で変更をかけると再作成されているように見える（destroyが付く）ネットワーク的に瞬断が発生するのかは未検証
* ansible だと YAML で書けて便利かもしれないが、手作業による修正差分が管理できなくなるので注意したほうがいい

    * ansible で最初に作成[1]
    * CLIやマネジメントコンソールで手修正[2]
    * ansible で他の修正[3]
    * [1,2,3]が全部イキの状態になる
    * 記述方法にもよるかもしれないが、これは構成管理とは言えない(2は管理できていない)
    * terraform の場合、手で修正を加えると差分として表示されるので、受け入れるかどうかを判断できるので、2を残すか捨てるか決められる
