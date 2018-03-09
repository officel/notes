# sed

## Examples

```
grep -l '置換対象' ./* | xargs sed -i.bak -e 's/置換対象/置換後/g'

# ファイル名をまとめて置換（pで1つ、;の後ろで置換して1つ出力して、xargsで2つずつ使う）
find ./ -type f | sed 'p;s/aaa/bbb/' | xargs -n2 mv
```

