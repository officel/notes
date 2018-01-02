# patch

patch の作り方と当て方

```
# short
diff -u BASE NEW > PATCH
patch -u < PATCH


## パッチを作る
diff -u main.c.orig main.c > main.patch

## パッチをあてる
patch < main.patch

## リバース（戻す）
patch -R < main.patch
```
