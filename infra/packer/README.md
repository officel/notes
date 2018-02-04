# Packer

* [Packer by HashiCorp](https://www.packer.io/)
* [Documentation - Packer by HashiCorp](https://www.packer.io/docs/index.html)
* ドキュメントをよく読む
* 適当なディレクトリに展開して、シンボリックリンクでバージョン切り替えをすると楽なのは terraform と同じ

## Command

```
packer build packer.json

# variables を外部ファイルで渡す。基本的に全てこの形に落とすと管理が楽
packer build -var-file=variables.json packer.json

```

## Base Template

``` package.json
{
  "_comment": "コメントはroot階層に一回しか書けないみたい",
  "description": "できるだけ書きましょう",
  "variables": {
    // 外部から変更可能な変数
  },

  "builders": [
    {
    // 複数のビルダーを書くこともできるみたいだけど、１ファイル１組み立てのほうがわかりやすい気がする
    // ちなみにファイルはjsonなので、コメントは_commentしか書けないし、validateされるので適当な名前のキーは受け付けない
    }
  ],

  "provisioners": [
    {
      "type": "shell",
      "script": "setup_things.sh"
    },
    {
      "type": "ansible",
      "playbook_file": "./playbook.yml"
    }
  ]
}

```
