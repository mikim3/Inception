#!/bin/bash

echo "before chown"
chown -R mysql:mysql /var/lib/mysql
echo "fin chown"

service mariadb start
sleep 0.2

echo "CREATE DATABASE IF NOT EXISTS $db1_name ;" > init.sql
echo "CREATE USER IF NOT EXISTS '$db1_user'@'%' IDENTIFIED BY '$db1_pwd' ;" >> init.sql
echo "GRANT ALL PRIVILEGES ON $db1_name.* TO '$db1_user'@'%' ;" >> init.sql
echo "FLUSH PRIVILEGES;" >> init.sql

echo "before mysql"
mysql < init.sql
echo "after mysql"

# rm /root/init.sql

# CREATE DATABASE wordpress_db;
# CREATE USER 'epicarts'@'%' IDENTIFIED BY 'password';
# GRANT ALL ON wordpress_db.* TO 'epicarts'@'%';
# FLUSH PRIVILEGES;

# echo "CREATE DATABASE IF NOT EXISTS $db1_name ;" > db1.sql
# echo "CREATE USER IF NOT EXISTS '$db1_user'@'%' IDENTIFIED BY '$db1_pwd' ;" >> db1.sql
# echo "GRANT ALL PRIVILEGES ON $db1_name.* TO '$db1_user'@'%' ;" >> db1.sql

service mariadb stop
sleep 0.2
mariadbd --user=root
