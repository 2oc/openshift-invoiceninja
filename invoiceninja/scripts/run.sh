#!/bin/sh

STAMP=$(date)

echo "invoiceninja:x:`id -u`:0:invoiceninja:/:/sbin/nologin" >> /etc/passwd

echo "[${STAMP}] Starting hourly ..."
/app/hourly/invoiceninja &

echo "[${STAMP}] Starting httpd daemon..."
# run apache httpd daemon
httpd -D FOREGROUND
