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
cat /proc/sys/fs/file-nr
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

## kipmi() 対策

```
echo 100 > /sys/module/ipmi_si/parameters/kipmid_max_busy_us
```