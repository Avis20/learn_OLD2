#!/bin/bash

echo "Positional Parameters"
echo '$0 = ' $0;
echo '$1 = ' $1;
echo '$2 = ' $2;
echo '$3 = ' $3;



docker-compose-restart() {
    var=$1;
    echo "Restart ${var}";
    docker-compose rm -fsv $var;
    docker-compose up -d $var;
}