#!/usr/bin/env bash

cd etcd-1;
vagrant destroy -f;

cd ..;

cd etcd-2;
vagrant destroy -f;

cd ..;