#!/usr/bin/env bash
set -x
DIR=$(dirname $(readlink -f $BASH_SOURCE))

# Replace production url with development url
cat ${DIR}/init.sql.tpl | sed -e 's/www.allihoppa.nl/allihoppa.nl.localhost/g' | ${mysql[@]}
