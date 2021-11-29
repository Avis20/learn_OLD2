FROM ubuntu

MAINTAINER Orlov Yaroslav <orlov.avis@yandex.ru>
RUN apt-get update && apt-get install -y cowsay fortune
COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

