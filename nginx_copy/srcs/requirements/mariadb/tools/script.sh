#!/bin/bash

mkdir -p /docker-entrypoint-initdb.d

# /var/lib/mysql 하위 폴더들에 대한 mysql의 권한부여
chown -R mysql:mysql /var/lib/mysql

# docker-entrypoint-initdb.d/*.sql 은 미리 정해진 경로
echo "CREATE DATABASE IF NOT EXISTS $db1_name ;" > /docker-entrypoint-initdb.d/init.sql
echo "CREATE USER IF NOT EXISTS '$db1_user'@'%' IDENTIFIED BY '$db1_pwd' ;" >> /docker-entrypoint-initdb.d/init.sql
echo "GRANT ALL PRIVILEGES ON $db1_name.* TO '$db1_user'@'%' ;" >> /docker-entrypoint-initdb.d/init.sql
echo "FLUSH PRIVILEGES;" >> /docker-entrypoint-initdb.d/init.sql

# MariaDB를 포그라운드에서 실행
exec mariadbd