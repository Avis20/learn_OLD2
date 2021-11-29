#!/usr/bin/env bash

cd etcd-1;
ln ../install-docker.sh .;
vagrant up;

cd ..;

cd etcd-2;
ln ../install-docker.sh .;
vagrant up;

cd ..;