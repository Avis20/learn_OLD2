#!/usr/bin/env bash

cd consul-1;
vagrant destroy -f;

cd ..;

cd consul-2;
vagrant destroy -f;

cd ..;