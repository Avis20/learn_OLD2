#!/usr/bin/env bash

if [ "$RUN" = 'DEV' ]; then
    echo "Run Dev server";
    exec python identidock.py
elif [ "$RUN" = 'UNIT' ]; then
    echo "Run Unit Tests";
    exec python test.py
else
    echo "Run Prod server";
    exec uwsgi --http 0.0.0.0:9090 --wsgi-file /app/identidock.py --callable app --stats 0.0.0.0:9191
fi