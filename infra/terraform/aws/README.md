# terraform aws provider

* [Provider: AWS - Terraform by HashiCorp](https://www.terraform.io/docs/providers/aws/index.html)
* provider aws は記述しなくても適切に判断してくれる
* 認証に関しても記述せずに環境変数を使用するほうが楽な上に可搬性があがる（実行環境には注意すること）
* d ディレクトリは data source

    * なるべくそのままのコードで実行可能なようにサンプルを記述
    * ドキュメントサンプルだけではわかりにくかったメモを残す

* r ディレクトリは resource

    * リソースを作成するとコストがかかるので注意
    * destroy -force で削除するのを忘れない
