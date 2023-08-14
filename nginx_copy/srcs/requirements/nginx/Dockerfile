FROM debian:bullseye

RUN apt-get update -y
RUN apt-get install curl -y
RUN apt-get install nginx openssl -y

COPY ./tools/script.sh /
COPY ./tools/wait-for-it.sh /

RUN chmod +x ./script.sh
RUN chmod +x ./wait-for-it.sh

CMD [ "./script.sh" ]

EXPOSE 443
