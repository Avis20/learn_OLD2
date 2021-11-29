#!/bin/sh

/usr/local/bin/etcd -name etcd-1 \
    -initial-advertise-peer-urls http://${HOSTA}:2380 \
    -listen-peer-urls http://0.0.0.0:2380 \
    -listen-client-urls http://0.0.0.0:2379,http://0.0.0.0:4001 \
    -advertise-client-urls http://${HOSTA}:2379 \
    -initial-cluster-token etcd-cluster-1 \
    -initial-cluster etcd-1=http://${HOSTA}:2380,etcd-2=http://${HOSTB}:2380 \
    -initial-cluster-state new

# curl -XPUT http://${HOSTA}:2379/v2/keys/skydns/config -d value='{"dns_addr": "0.0.0.0:53", "domain": "identidock.local"}'