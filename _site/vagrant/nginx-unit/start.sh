#!/usr/bin/env bash

sudo unitd --no-daemon &
sudo tail -f /var/log/unit.log
