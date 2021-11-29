#!/bin/sh

consul agent -data-dir /data -server -client 0.0.0.0 -advertise $HOSTA -bootstrap-expect 1