#!/usr/bin/env bash

dir='/home/avis/grive/Library/Music/*'
for f in $dir/* ; do
    echo $f;
    # sudo mv "$f" "./${f/.broken/}";
done



# # arr=$(ls -1tp $dir | grep -v / | head -n 10);

# for i in $(ls -1tp $dir | grep -v / | head -n 10); do
#     echo "Welcome $i times";
# done