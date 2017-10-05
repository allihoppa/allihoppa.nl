FROM allihoppa/allihoppa.nl:base

# Install Composer + Git + Zip so it can fetch from various sources
RUN apt-get update \
    && apt-get install -y git zlib1g-dev \
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && chmod +x composer.phar \
    && mv composer.phar /usr/local/bin/composer \

# Install PHP Xdebug extension
    && apt-get install php5-xdebug \
    && php -m | grep xdebug \

# Clear package cache
    && rm -rf /var/lib/apt/lists/*

# Add xdebug config
COPY xdebug.ini /etc/php5/conf.d/xdebug-extra.ini

ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /usr/local/bin/wp
RUN chmod o+rx /usr/local/bin/wp
