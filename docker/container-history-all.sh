#!/usr/bin/env bash

docker images -a | \
    grep $(docker inspect -f "{{.Image}}" $(docker ps -q) | \
        xargs -L 1 docker history -q | sed "s/^/\-e /")