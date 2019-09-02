Allihoppa website

[![Build Status](https://travis-ci.org/allihoppa/allihoppa.nl.svg?branch=master)](https://travis-ci.org/allihoppa/allihoppa.nl)

# Development
- Store a production database dump to `environment/dev/db/init/init.sql.tpl`
- run `make up`
- run `make -B environment/ci/db/init/init.sql.tpl` to generate an init sql for CI

Note: this project expects a [Træfɪk proxy server](http://lucasvanlierop.nl/blog/2017/06/25/accessing-your-docker-app-via-a-domain-name-using-traefik/) to be running.
 
