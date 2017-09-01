FROM ubuntu:12.04

MAINTAINER Lucas van Lierop <me@lucasvanlierop.nl>

RUN apt-get update && \
    apt-get install -y \
    apache2 \
    php5 \
    php5-cli \
    libapache2-mod-php5 \
    php5-gd \
    php5-mysql

COPY apache.conf /etc/apache2/sites-available/default

# No SSL required
RUN rm /etc/apache2/sites-available/default-ssl \

# No env vars required, these will be passed via Docker (Compose)
    && rm /etc/apache2/envvars \

# Log to stdout/stderr instead file
    && rm /etc/apache2/conf.d/other-vhosts-access-log \
    && sed -i 's@${APACHE_LOG_DIR}/error.log@/dev/stderr@' /etc/apache2/apache2.conf \

# Do not switch user/group
    && sed -i 's@User ${APACHE_RUN_USER}@@' /etc/apache2/apache2.conf \
    && sed -i 's@Group ${APACHE_RUN_GROUP}@@' /etc/apache2/apache2.conf \

# Allow Apache to write it's lock and run files as a non root user
    && chmod -R 777 /var/lock /var/run \
    && sed -i 's@${APACHE_PID_FILE}@/var/run/apache.pid@' /etc/apache2/apache2.conf \
    && sed -i 's@${APACHE_RUN_DIR}@/var/run@' /etc/apache2/apache2.conf \
    && sed -i 's@${APACHE_LOCK_DIR}@/var/lock@' /etc/apache2/apache2.conf \

# Run on a higher port number (allows running as a non root user)
    && sed -i "s/80/8000/" /etc/apache2/ports.conf

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

RUN a2enmod rewrite

WORKDIR /var/www

# Remove all default files provided by apache
RUN rm -rf *

CMD ["/usr/local/bin/docker-entrypoint.sh"]

