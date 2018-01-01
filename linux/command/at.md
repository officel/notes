# at

指定時間に１回だけ実行

see [atコマンドについて詳しくまとめました 【Linuxコマンド集】](https://eng-entrance.com/linux-command-at)

```
# service atd start
at hh:mm
コマンド入れる
CTRL+D

# スケジュールされたジョブのリスト
atq

# XX番のスケジュールの詳細
at -c XX

# XX 番のスケジュールの削除
atrm XX

# 12時間（720min）後に再起動
echo "shutdown -r now" | at now + 720 minutes
```
