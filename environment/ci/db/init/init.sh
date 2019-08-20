#!/usr/bin/env bash
set -x
DIR=$(dirname $(readlink -f $BASH_SOURCE))

# Replace production url with test url
cat ${DIR}/init.sql.tpl | sed -e 's/www.allihoppa.nl/ci.allihoppa.localhost/g' | ${mysql[@]}
