#!/bin/sh

STAMP=$(date)

echo "pgadmin:x:`id -u`:0:openshift-wordpress:/:/sbin/nologin" >> /etc/passwd

echo "[${STAMP}] Starting daemon..."
# run apache httpd daemon
httpd -D FOREGROUND
