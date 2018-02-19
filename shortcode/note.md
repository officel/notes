# short code

小ネタ集的な

行き場ができたら後で移動する

## メモリ

```
# リアルタイムチェック
vmstat -SM 1
free -m

# メモリクリア
echo 1 > /proc/sys/vm/drop_caches
# やったら戻す
echo 0 > /proc/sys/vm/drop_caches
# または
sudo sysctl -w vm.drop_caches=3

# swapをクリア（実メモリに注意）
sudo swapoff -a && sudo swapon -a
```

## 日付

```
# タイムスタンプを得る
date +%s
date -d "2018-1-11 0:00:00" +%s

# タイムスタンプから日時を得る
date --date "@1429151640"
```

```date.sh
#!/bin/bash

# 処理時間計測用開始時刻
ST=`date +%s`

# テスト用に巻き戻し
ST=`expr ${ST} - 3666`

# ここに処理

# 処理時間計測用終了時刻
ET=`date +%s`
SS=`expr ${ET} - ${ST}`
HH=`expr ${SS} / 3600`
SS=`expr ${SS} % 3600`
MM=`expr ${SS} / 60`
SS=`expr ${SS} % 60`
# 処理時間
echo   "Start date:" `date "+%Y/%m/%d %H:%M:%S" --date "@${ST}"`
echo   " End  date:" `date "+%Y/%m/%d %H:%M:%S" --date "@${ET}"`
printf "Total time:            %02d:%02d:%02d\n" ${HH} ${MM} ${SS}
```

# ユーザ

```
# 追加
useradd
# 削除
userdel
# パスワードを削除
passwd -d USER

# グループに追加
usermod -aG GROUP USER
# グループから削除
gpasswd -d USER GROUP
```

# ダミーファイル生成

```
# 一般的
dd if=/dev/zero    of=/dev/null bs=1024 count=1000000
# 遅い
dd if=/dev/random  of=/dev/null bs=1 count=1000000
# 速い
dd if=/dev/urandom of=/dev/null bs=1 count=1000000
```

# watch curl
```
watch -n 1 curl http://example.com/ -s
```
