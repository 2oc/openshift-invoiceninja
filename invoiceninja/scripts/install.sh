#!/bin/bash

mkdir /app/tmp
cd /app/tmp
curl -O https://dl.dropboxusercontent.com/u/2909575/ninja-v2.5.1.1.zip

cd /app/tmp
unzip ninja-v2.5.1.1.zip

cp -vfrp ninja/* /app/

php7 artisan optimize --force

chmod -R 755 /app/storage

cat <<EOF > /app/.env
APP_ENV=production
APP_DEBUG=false
APP_URL=https://invoice.moreorless.be
APP_KEY=32 long key
CACHE_DRIVER=file

DB_TYPE=mysql
DB_HOST=mysql.mol-invoiceninja.svc.cluster.local
DB_DATABASE=ninja
DB_USERNAME=ninja
DB_PASSWORD=ninja

MAIL_DRIVER=smtp
MAIL_PORT=465
MAIL_ENCRYPTION=ssl
MAIL_HOST=smtp.gmail.com
MAIL_USERNAME=
MAIL_FROM_NAME=
MAIL_PASSWORD=

PHANTOMJS_CLOUD_KEY='a-demo-key-with-low-quota-per-ip-address'

TRUSTED_PROXIES='37.143.3.0/24,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16'

SESSION_ENCRYPT=true
SESSION_SECURE=true

REQUIRE_HTTPS=true
EOF

cat <<EOF > /app/public/.htaccess
SetEnv HTTPS on
RequestHeader set X-Forwarded-Proto "https"
RequestHeader set X-Forwarded-Port "443"

RewriteEngine On
RewriteCond %{HTTP:X-Forwarded-SSL} !on [NC]
RewriteRule ^ https://%{SERVER_NAME}%{REQUEST_URI} [R,L]

<IfModule mod_rewrite.c>
    <IfModule mod_negotiation.c>
        Options -MultiViews
    </IfModule>

    RewriteEngine On

    # Redirect Trailing Slashes...
    RewriteRule ^(.*)/$ /$1 [L,R=301]

    # Handle Front Controller...
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteRule ^ index.php [L]

# In case of running InvoiceNinja in a Subdomain like invoiceninja.example.c
om,
# you have to enablel the following line:
# RewriteBase /
</IfModule>
EOF

mkdir /app/hourly
cat <<EOF > /app/hourly/invoiceninja
#!/bin/sh
while [ 1 ]
do
/usr/bin/php7 /app/artisan ninja:send-invoices
/usr/bin/php7 /app/artisan ninja:send-reminders
sleep 1h
done
EOF
chmod +x /app/hourly/invoiceninja
