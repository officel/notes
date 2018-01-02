# web 向け note

後で整理予定

## ダイジェスト認証

### conf file

```
Satisfy Any
Order Deny,Allow
Deny from all
Allow from i.p.add.r
Authtype Digest
AuthName     "Please Id and Password"
AuthUserFile /var/www/vhosts/.htdigest
Require      valid-user
```

### htdigest

```
htdigest [新規の場合に -c ] .htdigest "レルム文字列"
パスワード二回入力
```
