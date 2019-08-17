FROM allihoppa/allihoppa.nl:base

ADD build /var/www
RUN chmod +x /var/www/bin/*

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

CMD ["/usr/local/bin/docker-entrypoint.sh"]
