FROM ubuntu:bionic

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    tzdata \
    && rm -rf /var/lib/apt/lists/*

RUN ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime

CMD "ls -l /usr/share/zoneinfo /etc/localtime"