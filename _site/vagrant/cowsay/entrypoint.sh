#!/usr/bin/env bash

echo $HOME;

exit;

if [ $# -eq 0 ]; then
    /usr/games/fortune | /usr/games/cowsay
else
    /usr/games/cowsay "$@"
fi