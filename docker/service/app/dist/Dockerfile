FROM allihoppa/allihoppa.nl:base

ADD build/bin /var/www/bin
RUN chmod +x /var/www/bin/*
ADD build/public /var/www/public

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

CMD ["/usr/local/bin/docker-entrypoint.sh"]
