.DEFAULT_GOAL := all
.PHONY: all docker-base-images production_release quickstart start

SHELL=/bin/bash

all: docker-base-images production_release

quickstart:
	docker-compose up

start: docker-base-images quickstart

docker-base-images:
	docker-compose build wordpress
	docker-compose build php-build
	docker-compose build js-build

production_release:
	#todo make sure only minified js is used
	#todo install jquery etc. with dependency manager
	rsync \
		-a \
		-q \
		--progress \
		--include "*NL.po" \
		--exclude "*.po" \
		--include "*NL.mo" \
		--exclude "*.mo" \
		--exclude composer.json \
		--exclude '*.txt' \
		--exclude '*.less' \
		--exclude '*.scss' \
		--exclude '*.coffee' \
		--exclude '*._src.js' \
		--exclude '*install*.php' \
		--exclude wordpress/wp-includes/ID3 \
		--exclude wp-content/languages/themes \
		--exclude wp-content/uploads \
		--exclude wordpress/wp-content \
		--delete \
		public/ \
		release

	cat environment/prod/wordpress.apacheenv >> release/.htaccess
