#!/usr/bin/env bash


cd consul-1;
cp -f ../install-docker.sh .;
vagrant halt; vagrant up;

cd ..;

cd consul-2;
cp -f ../install-docker.sh .;
vagrant halt; vagrant up;

cd ..;