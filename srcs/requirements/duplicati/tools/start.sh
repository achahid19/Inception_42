#!/bin/bash

cd /usr/bin

exec duplicati-server --webservice-interface=any --webservice-port=8200 --disable-db-encryption --webservice-password=${DUPLICATI_PASSWORD}
