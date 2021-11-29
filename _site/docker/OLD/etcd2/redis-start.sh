#!/usr/bin/env bash

export HOSTA=3.3.3.2
export HOSTB=3.3.3.3

docker run --rm -d -p 6379:6379 --name redis redis:3

# Добавляем в консул
curl -XPUT http://$HOSTA:8500/v1/agent/service/register -d '{"name":"redis.service.consul", "address":"'$HOSTB'", "port":6379}'

# проверяем пинг
docker run --rm amouat/network-utils dig @$HOSTA +short redis.service.consul

docker run --rm redis:3 redis-cli -h redis.service.consul ping
