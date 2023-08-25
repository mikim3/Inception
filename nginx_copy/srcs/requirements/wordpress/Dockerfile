FROM debian:bullseye

RUN apt-get update -y

RUN apt-get install php7.4-fpm php7.4-mysql -y

RUN apt-get install mariadb-client -y
RUN apt-get install curl -y


COPY ./tools/script.sh /script.sh

RUN chmod +x script.sh

CMD [ "./script.sh" ]

EXPOSE 9000

# HEALTHCHECK --interval=20s --timeout=20s --retries=20 CMD pgrep php-fpm || exit 1