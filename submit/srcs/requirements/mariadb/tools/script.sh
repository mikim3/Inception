#!/bin/bash

# /var/lib/mysql 하위 폴더들에 대한 mysql의 권한부여
chown -R mysql:mysql /var/lib/mysql

service mariadb start
sleep 0.1

echo "CREATE DATABASE IF NOT EXISTS $db1_name ;" > init.sql
echo "CREATE USER IF NOT EXISTS '$db1_user'@'%' IDENTIFIED BY '$db1_pwd' ;" >> init.sql
echo "GRANT ALL PRIVILEGES ON $db1_name.* TO '$db1_user'@'%' ;" >> init.sql
echo "FLUSH PRIVILEGES;" >> init.sql

mysql < init.sql

service mariadb stop
sleep 0.1

# mariadbd 프로세스를 실행
mariadbd
