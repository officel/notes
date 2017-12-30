# MySQL

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
