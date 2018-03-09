# MySQL

## トラブル

```
show status like '%connect%';
show global variables like 'max_connections';

# ステータスリセット
flush status
```


## 接続

```
mysql -u root -p -h HOSTNAME DBNAME -e'show tables;'
```

## 設定等

```
select version();
select database();
select current_user();
```

## 一覧

```
show databases;
show tables;
show processlist;
show status;
show global status;
show variables;
show global variables;
show table status;
show index from TABLENAME
```

## 権限等

```
select user,host from mysql.user;
show grants for 'USER'@'HOST'
rename user 'OLDUSER'@'HOST' to 'NEWUSER'@'LOCLAHOST';
revoke all privileges, grant option from USER
flush privileges;
```

## クエリキャッシュを無効にする

```
SET GLOBAL query_cache_size=0;
SET GLOBAL query_cache_type=0;
SHOW GLOBAL VARIABLES LIKE '%query_cache%';

# see https://qiita.com/mamy1326/items/d1548d8cf4528277172a
```

## ユーザ一覧からユーザ権限を確認

```
mysql -u root -N -e 'select concat("SHOW GRANTS FOR `",user, "`@`",host, "`;") from mysql.user order by user,host;' > user.sql
mysql -u root -N < user.sql

# see https://qiita.com/raki/items/cfd015ac50806bbac40a
```


## ローカル設定ファイル

```
[client]
# user dev
# password=

# user prod
# password=

[mysql]
# rehash( auto completion )
auto-rehash

# User,Host,Database
prompt=\\u@\\h:\\d>\\_

# if you want disable this option: SET SQL_SAFE_UPDATES=0;
safe-updates
```

## メモ

```
# テーブルデータの件数一覧(InnoDBでは即時性も正確性も怪しいので注意)
select table_name, table_rows from information_schema.TABLES where table_schema = 'DB名';

# slave 停止（Slave_SQL_Running: No）
SET GLOBAL SQL_SLAVE_SKIP_COUNTER = 1;
START SLAVE;



```
