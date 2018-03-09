# System check

## short

```
# ホスト名
hostname

# システム
uname -a

# メッセージバッファの内容
dmesg | tail

# 仮想メモリの統計
vmstat 1

# CPU毎の使用状況
mpstat -P ALL 1

# プロセス毎のリソース使用状況
pidstat 1

# I/O統計
iostat -xz 1

# ネットワークトラフィック
sar -n DEV 1
sar -n TCP,ETCP 1

# タスク
top

## 起動してからの経過時間
uptime

## メモリ確認
free -m

## 各プロセスの詳細なメモリ使用状況
pmap -x <PID>

## プロセス
ps -ef

## 環境変数も表示(e)
ps auxfe

## スレッドも表示
ps -efL
pidstat -p ALL
```

# System info

```
# メモリ情報
cat /proc/meminfo

# メモリ断片化
cat /proc/buddyinfo
(DMA32の行の左が大きく右が小さいと断片化している)

# CPU情報
cat /proc/cpuinfo

# バージョン情報
cat /proc/version
```


# Log

```
# エラー等
sudo cat /var/log/messages

# セキュリティ
sudo cat /var/log/secure
```

# インターナルプロセスコミュニケーション

```
# サマリ
ipcs -u

# 制限表示
ipcs -l
```

# Security

```
# 今誰がログインしているか
w

# アカウント毎最終ログイン日時
lastlog

# ログイン履歴
last
```

# Software

```
# インストール済み
rpm -qa | sort
```

# Network

```
# 現在の接続状況
netstat -antp

# パケットロス等がないか
netstat -s
```
