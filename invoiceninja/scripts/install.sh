#!/bin/bash

cd /tmp

curl -o invoiceninja.tar.gz -SL https://github.com/hillelcoren/invoice-ninja/arc
hive/v2.4.8.tar.gz
tar -xzf invoiceninja.tar.gz
mv invoiceninja-2.4.8/* /app/
composer install --working-dir /app -o --no-dev --no-interaction  
