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

* シェルで substr っぽいの

```
str="0123456789"
echo ${str:0:3}  # 012
echo ${str:1:3}  # 123
echo ${str:0:-2}  # 01234567 末尾から2文字消す
```

* シェルでシングルクォートをエスケープ

```
# '123' + \' + '45' ということ
$ echo '123'\''45'
123'45
```

* シェルでデフォルト値

  * <code>${var:+val}</code> 中身があるなら代替値
  * <code>${var+val}</code> 定義されているなら代替値
  * <code>${var:-val}</code> 中身がないなら代替値
  * <code>${var-val}</code> 定義されていないなら代替値


* 複数のファイルを sed で置換

```
grep -l '置換対象の文字列' 対象のファイル | xargs sed -i .bak -e 's/置換対象/置換後/g'

-i "" でバックアップを作らないように指定できる
複数回実行すると先のgrepにヒットしない場合に sed にファイルのリストが渡らない
find /dir -type f | のようにして、ディレクトリ中のファイルを全て対象にする等で回避できる
```



