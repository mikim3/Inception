#!/bin/bash

# 172.21.0.3 wordpress 주소
# 172.21.0.2 mariadb주소

# RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/server_pkey.pem -out /etc/ssl/certs/server.crt -subj "/C=KR/ST=Seoul/L=Seoul/O=42/CN=www.example.com"
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/server_pkey.pem -out /etc/ssl/certs/server.crt -subj "/C=KR/L=Seoul/O=42/CN=www.example.com"
# openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/server_pkey.pem -out /etc/ssl/certs/server.crt -subj ""
# COPY ./conf/default.conf ./etc/nginx/conf.d/default.conf

echo "fin openssl"

echo "
server
{
	listen 443 ssl;
  # ssl_protocol로  TLSv1.2,1.3 둘다 사용
	ssl_protocols  TLSv1.3;

	ssl_certificate /etc/ssl/certs/server.crt;
	ssl_certificate_key /etc/ssl/private/server_pkey.pem;

	root /var/www/html;

	index index.php index.html index.htm;

	server_name _;

	location / {
		try_files $uri $uri/ =404;
	}

	location ~ \.php$ {
		include snippets/fastcgi-php.conf;

		# fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
		fastcgi_param SCRIPT_FILENAME /var/www/html/$fastcgi_script_name;
		# docker-compose에 서비스네임 가져다씀
		fastcgi_pass my_wordpress:9000;
	}
} " >  /etc/nginx/sites-available/default

echo "fin make default"


nginx -g "daemon off;"
