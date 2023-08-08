#!/bin/bash
mkdir -p /var/www/html

cd /var/www/html

# 기존에 있으면 삭제
rm -rf *

# WP-CLI를 다운로드합니다.
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# 다운로드한 WP-CLI를 실행 가능하도록 만듭니다.
chmod +x wp-cli.phar

# WP-CLI를(wp명령어를) 전역적으로 사용할 수 있도록 이동합니다.
mv wp-cli.phar /usr/local/bin/wp

# WordPress Core를 다운로드합니다.
wp core download --allow-root

# wp-config.php 파일을 생성합니다.
wp config create --dbname=$db1_name --dbuser=$db1_user --dbpass=$db1_pwd --dbhost=my_mariadb:3306 --allow-root

# WordPress를 설치합니다.
wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root

wp theme install astra --activate --allow-root

sed -i 's/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/g' /etc/php/7.4/fpm/pool.d/www.conf

# PID 파일의 디렉터리를 확인하고 없으면 생성합니다.
mkdir -p /run/php

# PHP-FPM을 포그라운드에서 실행합니다.
exec /usr/sbin/php-fpm7.4 -F
