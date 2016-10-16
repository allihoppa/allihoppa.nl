FROM ubuntu:12.04

MAINTAINER Lucas van Lierop <lucas@vanlierop.org>

RUN apt-get update && \
    apt-get install -y \
    apache2 \
    php5 \
    php5-cli \
    libapache2-mod-php5 \
    php5-gd \
    php5-mysql

COPY apache.conf /etc/apache2/sites-available/default

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

RUN a2enmod rewrite

WORKDIR /var/www

# Remove all default files provided by apache
RUN rm -rf *

CMD ["/usr/local/bin/docker-entrypoint.sh"]

