#!/usr/bin/env bash

LOCAL_PORT=3000

if [ $PORT ]; then
    LOCAL_PORT=$PORT;
fi

unbuffer perl /Avis20/script/avis20_server.pl -p $LOCAL_PORT -rd --rd 1

