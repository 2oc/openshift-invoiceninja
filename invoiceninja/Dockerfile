FROM weepee-registry/php-webserver

# Entrypoint
ADD scripts/run.sh /scripts/run.sh

ADD scripts/install.sh /tmp/install.sh

# Remove and mount attached storage
RUN chmod -R 755 /scripts && chmod a+rwx /app
