FROM debian:jessie
MAINTAINER Orlov Yaroslav <orlov.avis@yandex.ru>

RUN apt-get update --fix-missing && apt-get install -y -qq \
    traceroute curl dnsutils netcat-openbsd jq nmap \
    net-tools \
    && rm -rf /var/lib/apt/lists/*

COPY Dockerfile /Dockerfile

LABEL org.label-schema.docker.dockerfile="/Dockerfile" \
      org.label-schema.vcs-type="Git" \
      org.label-schema.vcs-url="https://github.com/amouat/network-utils-container"
