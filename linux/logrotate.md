# logrotate

* [ログローテーション(logrotate)を使ってみる ( httpd(apache)の設定例 ) | レンタルサーバー・自宅サーバー設定・構築のヒント](https://server-setting.info/centos/loglotation.html)
* [logrotate 設定方法](http://changineer.info/server/logging/logrotate.html)
* [logrotateでログファイルがローテーションされない事への対処｜A Day In The Boy's Life](https://ameblo.jp/itboy/entry-10027962914.html)
* [MySQL ログのローテーション設定（logrotate）（flush-logs が cron で動かないときの対処を含む） - 彼女からは、おいちゃんと呼ばれています](http://blog.inouetakuya.info/entry/20130320/1363776504)

## メモ

* マシンキッティングする際にインストールしておく
* 設定ファイルは ansible で送り付けるのが楽
* missingok をセットしておけばログファイルがなくてもエラーにならないので設定ファイル自体を送り付けておいても大して問題にならないんじゃないかと思っている
* AWS なら Kinesis Firehose に送ればいいので、きっちり管理しなくてもいい気もする（ダメ
