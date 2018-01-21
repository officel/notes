# Configuration

* [Configuration - Terraform by HashiCorp](https://www.terraform.io/docs/configuration/index.html)
* [Load Order and Semantics - Terraform by HashiCorp](https://www.terraform.io/docs/configuration/load.html)

    * ファイルはアルファベット順に読み込まれる
    * 拡張子は .tf または .tf.json が対象

* [Configuration Syntax - Terraform by HashiCorp](https://www.terraform.io/docs/configuration/syntax.html)

    * 書き方はリンク先にも書いてある[HCL](https://github.com/hashicorp/hcl)を参考にする

* [Interpolation Syntax - Terraform by HashiCorp](https://www.terraform.io/docs/configuration/interpolation.html)

    * 各構文について個別にチェックする

* [Overrides - Terraform by HashiCorp](https://www.terraform.io/docs/configuration/override.html)

    * 例が悪くて使い道がいまいちわかっていない

* [Configuring Resources - Terraform by HashiCorp](https://www.terraform.io/docs/configuration/resources.html)

    * メタパラメータ（count, depends_on, provider, lifecycle）
    * タイムアウトブロック（timeouts block）
    * full syntax

* [Configuring Data Sources - Terraform by HashiCorp](https://www.terraform.io/docs/configuration/data-sources.html)

    * 既存リソースから必要な分を探して使用できる
    * 複数のタグ等で一意になるようにリソースを設計しておくと便利

* [Configuring Providers - Terraform by HashiCorp](https://www.terraform.io/docs/configuration/providers.html)

    * version コントロールが必要になったら

* [Configuring Input Variables - Terraform by HashiCorp](https://www.terraform.io/docs/configuration/variables.html)

    * vars を使うのは一式出来上がった後でリファクタリングにしたほうが早い気がする
    * vars ファイルは terraform.tfvars か  *.auto.tfvars

* [Configuring Outputs - Terraform by HashiCorp](https://www.terraform.io/docs/configuration/outputs.html)

    * モジュール化する時は必要になるけど、通常はなくても大丈夫
    * output を期待してコードを書くと後で困るかも
    * 別モジュールの output を期待するよりも data source で検索したほうが便利

* [Configuring Local Values - Terraform by HashiCorp](https://www.terraform.io/docs/configuration/locals.html)

    * 中間変数的に利用可
    * data source で count を使って複数値を返して、local vars で ids みたいに使える

* [Configuring Modules - Terraform by HashiCorp](https://www.terraform.io/docs/configuration/modules.html)

    * 共通の処理をモジュール化
    * それこそ一式出来上がった後でリファクタリングにしたほうが早い気がする（急がば回れ）
    * [Terraform Module Registry](https://registry.terraform.io/)

* [Configuring Terraform - Terraform by HashiCorp](https://www.terraform.io/docs/configuration/terraform.html)

    * 最小バージョンの指定など
    * 環境にもよるが頻繁にバージョンアップしている昨今、最新バージョンに追従しないと後で困る

* [Configuring Terraform Enterprise - Terraform by HashiCorp](https://www.terraform.io/docs/configuration/terraform-enterprise.html)

    * Terraform Enterprise を使用する際に

* [Environment Variables - Terraform by HashiCorp](https://www.terraform.io/docs/configuration/environment-variables.html)

    * ログのレベルを変更
    * ログファイルを指定
