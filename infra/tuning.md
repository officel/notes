# Tuning

サーバ設定など。ほとんど CentOS6 向け

## RPS / RFS

```
cat /sys/class/net/eth0/queues/rx-0/rps_flow_cnt
cat /proc/sys/net/core/rps_sock_flow_entries
cat /sys/class/net/eth0/queues/tx-0/xps_cpus
cat /sys/class/net/eth0/queues/rx-0/rps_cpus
```

## ファイルハンドル

```
ulimit -u
# -a の open files が１プロセスのディスクリプタ数
# -n がファイルディスクリプタの値

# /etc/sysconfig/init
ulimit -n 65536

cat /proc/sys/fs/file-nr
# 過去にオープンした最大値（割り当て済みファイルハンドル数）
# 現在オープンしているファイルハンドル数
# オープン可能なファイル数の最大（file-max の値のはず）
```

## socket,backlog, etc...

```
sysctl net.core.somaxconn
```

## memory

```
sysctl vm.overcommit_memory
sysctl vm.panic_on_oom
sysctl kernel.panic
```

## メモリ断片化チェック

```
# DMA32の行の左が大きく右が小さいと断片化している
cat /proc/buddyinfo
```

## Network

```
sysctl net.ipv4.tcp_fin_timeout
sysctl net.ipv4.tcp_tw_recycle
sysctl net.ipv4.tcp_tw_reuse
sysctl net.ipv4.ip_local_port_range
sysctl net.ipv4.tcp_keepalive_intvl
sysctl net.ipv4.tcp_keepalive_probes
sysctl net.ipv4.tcp_keepalive_time
```

* [net.ipv4.tcp_tw_recycle は廃止されました ― その危険性を理解する - Qiita https://qiita.com/tmshn/items/b49f1b51bfc472968b30]

    * Linux のカーネルバージョン v4.12 から廃止

## kipmi() 対策

```
# 動的
echo 100 > /sys/module/ipmi_si/parameters/kipmid_max_busy_us

# 永続化
vi /etc/modprobe.d/ipmi.conf
options ipmi_si kipmid_max_busy_us=100
```
