#!/usr/bin/env bash



# inotifywait -e close_write,moved_to,create -m ./MyApp |
# while read -r directory events filename; do
#     echo 1;
#   # if [ "$filename" = "myfile.py" ]; then
#   #   ./myfile.py
#   # fi
# done