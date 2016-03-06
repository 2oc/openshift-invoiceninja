#!/bin/sh

STAMP=$(date)

echo "[${STAMP}] Starting hourly ..."
#/app/hourly/invoiceninja &

echo "[${STAMP}] Starting httpd daemon..."
# run apache httpd daemon
httpd -D FOREGROUND
