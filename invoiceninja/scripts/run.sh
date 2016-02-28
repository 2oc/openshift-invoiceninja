#!/bin/sh

STAMP=$(date)

echo "invoiceninja:x:`id -u`:0:invoiceninja:/:/sbin/nologin" >> /etc/passwd

echo "[${STAMP}] Starting daemon..."
# run apache httpd daemon
httpd -D FOREGROUND


# ENV DB_HOST mysql
# ENV DB_DATABASE ninja
# ENV APP_KEY SomeRandomString
# ENV LOG errorlog
# ENV APP_DEBUG 0
