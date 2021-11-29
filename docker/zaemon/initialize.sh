#!/usr/bin/env sh

createuser sample-db-owner
createdb sampledb --owner=sample-db-owner