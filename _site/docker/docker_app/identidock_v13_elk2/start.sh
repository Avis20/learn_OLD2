#!/usr/bin/env bash

echo "Start virtual with project";
cd identiproject/ && vagrant up;

echo "Start Project";
cd ../identiansible/ && docker-compose up