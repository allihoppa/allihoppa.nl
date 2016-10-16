FROM allihoppa/allihoppa.nl

# Install Composer + Git + Zip so it can fetch from various sources
RUN apt-get update \
    && apt-get install -y git zlib1g-dev \
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && chmod +x composer.phar \
    && mv composer.phar /usr/local/bin/composer \
    && rm -rf /var/lib/apt/lists/*

# To prevent this image running continuously when started via docker-compose, override it's command
CMD echo "No command to run, exiting"; exit 0
