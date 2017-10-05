#!/bin/bash
set -e

bin/wait-for-db && \
php bin/upgrade.php && \
exec /usr/sbin/apache2 -DFOREGROUND


#clear && ./wp user update annelies --user_pass=test

