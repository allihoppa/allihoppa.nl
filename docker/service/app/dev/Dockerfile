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
    && apt-get install -y php-xdebug \
    && php -m | grep xdebug \

# Install PHP Curl extension
    && apt-get install -y php7.0-curl \
    && php -m | grep curl \

# Clear package cache
    && rm -rf /var/lib/apt/lists/*

# Add xdebug config
COPY xdebug.ini /etc/php/7.0/mods-available/xdebug.ini
