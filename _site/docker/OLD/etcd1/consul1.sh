#!/usr/bin/env bash

HOSTA=3.3.3.2

docker run --rm -d --name consul -h consul-1 \
    -p 8300:8300 -p 8301:8301 -p 8301:8301/udp \
    -p 8302:8302 -p 8400:8400 -p 8500:8500 -p $HOSTA:53:8600/udp \
    gliderlabs/consul agent -data-dir /data -server \
    -client 0.0.0.0 -advertise $HOSTA -bootstrap-expect 2

exit;

# Проверка

export HOSTA=3.3.3.2

curl -XPUT http://$HOSTA:8500/v1/kv/hello -d world
curl -s http://$HOSTA:8500/v1/kv/foo | jq .

curl -s http://$HOSTA:8500/v1/kv/hello | jq -r '.[].Value' | base64 -d
world

docker run --rm --name dns_test -it ubuntu:latest


curl -XPUT http://$HOSTA:8500/v1/agent/service/register