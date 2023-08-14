FROM debian:bullseye

RUN apt-get update -y

RUN apt-get install php7.4-fpm php7.4-mysql -y

RUN apt-get install mariadb-client -y
RUN apt-get install curl -y


COPY ./tools/wait-for-it.sh /wait-for-it.sh
COPY ./tools/script.sh /script.sh

RUN chmod +x wait-for-it.sh
RUN chmod +x script.sh

CMD [ "./script.sh" ]

EXPOSE 9000
