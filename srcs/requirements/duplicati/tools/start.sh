#!/bin/bash

# Ensure target directory exists
cd /usr/bin

# Run duplicati-server in the foreground
exec duplicati-server --webservice-interface=any --webservice-port=8200 --disable-db-encryption --webservice-password=${DUPLICATI_PASSWORD}
