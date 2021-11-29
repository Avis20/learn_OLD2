#!/usr/bin/env bash


# siege -g -v \
siege -b -c3 -t30S -v \
'http://fonmix.local//api/yellow/player/info?with=contracts&with=services POST' \
--header 'X-Player-Secret-Key: 5a65fbe1-dc89-55d7-03de-0f0903da29db' \
--header 'X-Player-Device-Key: 111' \
--header 'X-Player-Version: 1'
