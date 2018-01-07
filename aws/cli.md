# cli

Command Line Interface.

* [AWS コマンドラインインターフェイス（CLI）のドキュメント｜AWS](https://aws.amazon.com/jp/documentation/cli/)
* [jq](https://stedolan.github.io/jq/) をインストールしておくと便利

## Setting

* [設定ファイルと認証情報ファイル](https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/cli-config-files.html)
* この付近のドキュメントをよく読む
* AssumeRole を使う時は[IAM ロールの切り替え](https://docs.aws.amazon.com/ja_jp/IAM/latest/UserGuide/id_roles_use_switch-role-cli.html)を参考にする
* これらはこれらとして、インフラ作業用のアカウントのテストをするには[Environment Variables](https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/cli-environment.html)を参考に、環境変数で対応すると後々楽

    * jenkins にはクレデンシャルを扱う機能がある
    * terraform や ansible はこれらの環境変数を読み込むことができる（正確にはbotoが）

* [コマンド補完](https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/cli-command-completion.html)も便利なので設定しておく

## Memo

```
# アカウントやロールを切り替えた後のテストに
aws s3 ls

#

```



