FROM ubuntu:16.04

MAINTAINER Lucas van Lierop <me@lucasvanlierop.nl>

ENV APACHE_PID_FILE=/var/run/apache2.pid
ENV APACHE_RUN_DIR=/var/run
ENV APACHE_LOCK_DIR=/var/lock
ENV HTTP_PORT=8000

RUN apt-get update && \
    apt-get install -y \
    apache2 \
    php7.0 \
    php7.0-cli \
    libapache2-mod-php7.0 \
    php7.0-gd \
    php7.0-mysqli

# No default (SSL) vhosts required
RUN rm /etc/apache2/sites-available/* \

# No env vars required, these will be passed via Docker (Compose)
    && rm /etc/apache2/envvars \

# Log to stdout/stderr instead file
    && rm /etc/apache2/conf-available/other-vhosts-access-log.conf \
    && rm /etc/apache2/conf-enabled/other-vhosts-access-log.conf \
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
    && sed -i "s/80/${HTTP_PORT}/" /etc/apache2/ports.conf \

# Disable dir listing
    && a2dismod -f autoindex \

# Disable sending info about PHP in HTTP Response headers
    && sed -i 's/expose_php = On/expose_php = Off/' /etc/php/7.0/apache2/php.ini

COPY apache-default-vhost.conf /etc/apache2/sites-available/000-default.conf

RUN a2enmod rewrite

WORKDIR /var/www

# Remove all default files provided by apache
RUN rm -rf *

ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/local/bin/wp
RUN chmod o+rx /usr/local/bin/wp

CMD ["/usr/sbin/apache2", "-DFOREGROUND"]
