.DEFAULT_GOAL := all
.PHONY: all docker-base-images docker-dist-image quickstart start

SHELL=/bin/bash

DIST_BUILD_DIR=docker/service/app/dist/build

all: docker-base-images docker-dist-image

quickstart:
	docker-compose -f environment/dev/docker-compose.yml up

start: docker-base-images quickstart

docker-base-images:
	docker-compose -f environment/default/docker-compose.yml build app-base
	docker-compose -f environment/default/docker-compose.yml build app-dev
	docker-compose -f environment/default/docker-compose.yml build js-build


docker-dist-image:
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
		${DIST_BUILD_DIR}

# TODO:
#	cat environment/prod/wordpress.apacheenv >> release/.htaccess

	docker-compose -f environment/ci/docker-compose.yml build app
