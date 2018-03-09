# sar

システムアクティビティの収集、報告、保管

see [IBM Knowledge Center - sar コマンド](https://www.ibm.com/support/knowledgecenter/ja/ssw_aix_72/com.ibm.aix.cmds5/sar.htm)

see [sarコマンドの使い方 - Qiita](https://qiita.com/hana_shin/items/6f00ca48a8de90478f88)

sysstat をパッケージインストールして常時起動にしておけばひとまず安心

```
# 16日の10時から13時のCPU状況
sar -P ALL -s 10:00:00 -e 13:00:00 -f /var/log/sa/sa16
```