# aws

範囲が広いので独立

一度に全部はできないけど少しずつ知見を集めておく

## Tag について

* タグ付けできるリソースは適切なName、その他グルーピングで使用できるタグを指定する

    * マネジメントコンソールのリソースタグで使用できる
    * terraform で data source を使用する際のフィルタに使用できる

* タグ付けルールをつくるといいかもしれない

    * key

        * できる限り一単語、先頭のみ大文字（アッパーキャメルケース）
        * Nameはタグ付け可能なリソースすべてにつけること
        * その他のタグは２つ以上のリソースが存在する場合に、２つ以上のグループ化のためにつけること

    * value

        * できる限り一単語、全て小文字（ローワーケース、単語の間は半角スペース１つ）
        * 慣れればリソースIDでサービスは判断できるのでサービス名をNameに含めるのはやめる？

* タグ付けしないルールも用意しておくといいかも

    * Author は管理には向いているかもしれないが、自動化ツールで再作成都度値が変わると面倒かも
    * Date も同様

### タグ管理表

No | key | value(ex)
--- | --- | -----
1   | Name | **resource name**
2   | Project | **project name**
3   | Env(ironment) | prod, stg, dev, test
4   | Service | **my service domain**
5   | Tier | public, private, db, cache

* Name はなるべくリソース固有の値になるようにつけたい
* Project は１アカウント１プロジェクトの場合にはなくてもいいが、自動化するならあったほうがよい
* Environment は長いので短くしてもよい。環境はプロジェクトに必要なだけつける

    * [State: Environments - Terraform by HashiCorp](https://www.terraform.io/docs/state/environments.html)
    * terraform の以前のバージョンでは environment がステートの状態を表す変数として定義されており、IDEなどのコードヘルパーが反応してしまうことがある
    * stateのプロパティとして参照すると、存在していない場合に"default" になってしまう（本来は空が望ましい）
    * 存在していれば（output environment とすれば）その値を取得できる
    * terraform側の仕様だけど若干使いにくいので、短い Env または Staging などを使用するといいかもしれない（とはいえ結局どれもよくないのでは。。。）
    
* Service はweb,dbのような大枠や、rds,ecsのようなSaaSサービス名、ではなく、プロジェクト内の固有のサービスで分割するとよい。認証、チャット、機能といったサービスドメイン名が望ましい
* Tier は主にsubnetのグルーピング用
