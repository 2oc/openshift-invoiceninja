FROM weepee-registry/php-webserver

# Add clean wordpress
ADD app /app

# database config
ADD config.inc.php /app/conf/config.inc.php

# Entrypoint
ADD scripts/run.sh /scripts/run.sh

# Remove and mount attached storage
RUN chmod -R 755 /scripts && chmod a+rwx /app
