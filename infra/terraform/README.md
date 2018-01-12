# terraform

* [Terraform by HashiCorp](https://www.terraform.io/)
* /usr/local/share などにバージョンがわかるようにダウンロードして展開、/usr/local/bin にシンボリックリンクを置くようにするとバージョン差を確認したりするのに便利（そういうプレイブックを書いた）
* [Terraform Recommended Practices - Terraform by HashiCorp](https://www.terraform.io/docs/enterprise/guides/recommended-practices/index.html)
* 管理対象のリソースが多くなると実行時間が長くなったり、ちょっとした変更が困難になることがあるので、適度に分割する
* init と plan を定期的に実行し、状態を維持する
* バックエンドはリモートにする
* output は必要最低限で大丈夫
* なるべく data リソースで連携する
* リソース名はわかりやすくする。

    * リソースタイプとリソース名が同じものが２つあるとエラー
    * リソースタイプが異なっていればリソース名は同じものは許可される
    * 特定の構成を作る、例えばbastionを管理するtfを記述する場合、リソース名を同じにすると楽
    * ファイル内での参照はオブジェクト参照に似ていて、データソースなどの親オブジェクト、リソースタイプ、リソース名、引数（プロパティ的な。原文ではarguments）なので、バッティングしない

* 公式モジュールの利用は推奨するが自己責任
* 自作モジュールは可読性や再利用性などを考慮してほどほどにする
* env（deprecated）や workspace は一見便利そうだが管理が手間だし環境差を吸収する用途には向いていない。むしろディレクトリを分けてそれぞれに設定値を記述するほうが見通しはよいのではないか

* [Terraforming by dtan4](http://terraforming.dtan4.net/) 既存のAWSリソースをterraform形式でexportするツール

## memo

### remote_state を編集して戻す手順

```
terraform state pull > terraform.tfstate
vi terraform.tfstate
terraform state push terraform.tfstate
terraform plan
rm terraform.tfstate
```
