FROM weepee-registry/php7-webserver

# Entrypoint
ADD scripts/run.sh /scripts/run.sh

ADD scripts/install.sh /tmp/install.sh

# Remove and mount attached storage
RUN chmod -R 755 /scripts && chmod a+rwx /app

# Modify root dir
RUN sed -i 's/app/app\/public/' /etc/apache2/httpd.conf
