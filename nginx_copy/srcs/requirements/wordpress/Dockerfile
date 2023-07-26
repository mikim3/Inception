FROM debian:bullseye

RUN apt-get update -y

RUN apt-get install php-fpm php-mysql -y

RUN apt-get install mariadb-client -y
RUN apt-get install curl -y

COPY ./tools/script.sh /
CMD [ "./script.sh" ]

EXPOSE 9000
