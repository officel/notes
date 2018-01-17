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

* VPC のデフォルトセキュリティグループは terraform で管理する場合に[注意が必要](https://github.com/officel/notes/edit/master/aws/securitygroup.md)

   * 今のところ触らない方針にする予定
   * 強固なセキュリティが必要な場合（同じネットワークに接続したマシン間での通信に制限が必要になるならそれは設計がおかしいのでは？）にデフォルト通信を制限するなら有効かもしれない。が、その場合もインスタンスにデフォルトセキュリティグループを割り当てなければいい気がする
   * 使用用途や例の情報を収集してみる必要がある
