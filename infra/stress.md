# stress

* [stress project page](https://people.seas.harvard.edu/~apw/stress/)
* yum install stress --enablerepo=epel
* モニタリングのアラート発報用に

## ex

```
# CPUに負荷をかける（論理プロセッサー10個、タイムアウト11分）
stress -c 10 -q -t 660 &

# Memory（256M x 10 = 約2.5G、メモリを開放しない、タイムアウト11分）
stress -m 10 --vm-hang 0 -q -t 660 &

# hdd（ディスク書き込みと削除をする、けど正直よくわからない）
stress -d 1 -v

```

※ タイムアウトを11分にしているのはモニタリングでアラートを検知するのにかかる時間＋アルファ


## CPUのメモ

```
# 物理 CPU の数
grep physical.id /proc/cpuinfo | sort -u | wc -l

# CPU ごとのコアの数
grep cpu.cores /proc/cpuinfo | sort -u

# 論理プロセッサーの数
grep processor /proc/cpuinfo | wc -l
```

## Memory のメモ

```
cat /proc/meminfo
free
```

