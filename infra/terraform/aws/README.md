# terraform aws provider

* [Provider: AWS - Terraform by HashiCorp](https://www.terraform.io/docs/providers/aws/index.html)
* provider aws は記述しなくても適切に判断してくれる

    * skip～引数を使っているサンプルちょいちょい増えた？
    * バリデーションをスキップすることで処理時間が短くなるようだけど、検証する時間が（もったい）ない
    * 最終的に定期的な自動運用にするならスキップしないほうが安心できる気がする
    
* 認証に関しても記述せずに環境変数を使用するほうが楽な上に可搬性があがる（実行環境には注意すること）
* d ディレクトリは data source

    * なるべくそのままのコードで実行可能なようにサンプルを記述
    * ドキュメントサンプルだけではわかりにくかったメモを残す

* r ディレクトリは resource

    * リソースを作成するとコストがかかるので注意
    * destroy -force で削除するのを忘れない
