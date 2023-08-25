FROM debian:bullseye

RUN apt-get update -y
RUN apt-get install curl -y
RUN apt-get install nginx openssl -y

COPY ./tools/script.sh /

RUN chmod +x ./script.sh

CMD [ "./script.sh" ]

EXPOSE 443

# HEALTHCHECK --interval=20s --timeout=20s --retries=20 CMD curl -k -f https://localhost || exit 1