#!/bin/bash
bin/wait-for-db && \
php bin/upgrade.php && \
exec /usr/sbin/apache2 -DFOREGROUND
