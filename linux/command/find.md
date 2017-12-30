# find

## Examples

```
# カレントディレクトリ以下でファイルサイズが1MB以上のファイルをls形式で表示
find . -size +1M -ls

# 期間指定 
find . -mtime -14 -mtime +7 -ls

# 最近更新したファイル
find . -mmin -30 -ls

# .git をまとめて削除
find . -name .git -exec rm -rf {} \;

# シンボリックリンクを探す
find . -type l -exec ls -l {} \;

# 正規表現を使って拡張子の異なるファイルを探す
find -regextype posix-egrep -regex ".*\.(php|tpl)" -ls

# 文字列が含まれたファイルを探す
find . -name "*.php" | xargs grep "search"
grep "search" -rl .

```
