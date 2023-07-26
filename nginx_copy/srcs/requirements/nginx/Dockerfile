FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && apt-get -y install nginx openssl vim

# RUN apt install php

COPY ./tools/script.sh /

CMD [ "./script.sh" ]

EXPOSE 443
