FROM weepee-registry/php7-webserver

# php ini
COPY php.ini /etc/php7/php.ini

# Entrypoint
ADD scripts/run.sh /scripts/run.sh

ADD scripts/install.sh /scripts/install.sh

# Remove and mount attached storage
RUN chmod -R 755 /scripts && chmod a+rwx /app

# Modify root dir (after install)
RUN sed -i 's/app/app\/public/' /etc/apache2/httpd.conf
