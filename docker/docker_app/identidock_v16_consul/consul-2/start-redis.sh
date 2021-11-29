#!/bin/sh

consul agent -data-dir /data -server -client 0.0.0.0 -advertise $HOSTB -join $HOSTA;

curl -XPUT http://$HOSTB:8500/v1/agent/service/register -d '{"name":"redis", "address":"'$HOSTB'", "port":6379}';
