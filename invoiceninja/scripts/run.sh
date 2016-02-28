#!/bin/sh

STAMP=$(date)

echo "invoiceninja:x:`id -u`:0:invoiceninja:/:/sbin/nologin" >> /etc/passwd

echo "[${STAMP}] Starting daemon..."
# run apache httpd daemon
httpd -D FOREGROUND
