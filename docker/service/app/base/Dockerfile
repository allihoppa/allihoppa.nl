FROM ubuntu:12.04

MAINTAINER Lucas van Lierop <me@lucasvanlierop.nl>

ENV APACHE_PID_FILE=/var/run/apache2.pid
ENV APACHE_RUN_DIR=/var/run/apache2
ENV APACHE_LOCK_DIR=/var/lock/apache2

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

# Disable sending info about the server in signature on error pages
    && echo 'ServerSignature Off' >> /etc/apache2/apache2.conf \

# Disable sending info about the server in signature in HTTP response headers
    && echo 'ServerTokens Prod' >> /etc/apache2/apache2.conf \

# Allow mounting a tmpfs for lock and run files (so the container can run as read only)
    && rm -rf /var/lock /var/run \

# Run on a higher port number (allows running as a non root user)
    && sed -i "s/80/8000/" /etc/apache2/ports.conf \

# Disable dir listing
    && a2dismod autoindex \

# Disable sending info about PHP in HTTP Response headers
    && sed -i 's/expose_php = On/expose_php = Off/' /etc/php5/apache2/php.ini

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

RUN a2enmod rewrite

WORKDIR /var/www

# Remove all default files provided by apache
RUN rm -rf *

CMD ["/usr/local/bin/docker-entrypoint.sh"]

