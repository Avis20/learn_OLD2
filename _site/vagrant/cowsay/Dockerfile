FROM debian

MAINTAINER Orlov Yaroslav <orlov.avis@yandex.ru>

RUN apt-get update && apt-get install -y cowsay fortune

COPY entrypoint.sh /

RUN mkdir /data/ && /bin/echo 1 > /data/test

VOLUME /data

# ENTRYPOINT "/entrypoint.sh"