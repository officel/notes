# Shell

* シェル上で使うもののメモ
* シェルの種類は基本的に bash のもののはず
* 気にしてメモとっていないので誤りがあるかも

```
# 現在のシェル
echo $SHELL
```

## ファイルを空にする操作あれこれ

```
# zsh 向け
 : > file

# bash 向け
> file

# シェルによらない（はず）
cp /dev/null file
echo -n > file
cat > file  のあと CTRL+C
```

## メモ

* [bash/zshでsourceされたスクリプト内で、ファイル自身の絶対パスをとるシンプルな記法 - Qiita](https://qiita.com/yudoufu/items/48cb6fb71e5b498b2532)

```
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
```