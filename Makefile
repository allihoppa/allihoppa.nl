.DEFAULT_GOAL := help

SHELL=/bin/bash

export HOST_UID=$(shell id -u)
export HOST_GID=$(shell id -g)

export DEPLOY_UID=2000
export DEPLOY_GID=2000

PLATFORM := $(shell uname -s)
ifeq ($(PLATFORM),Darwin)
export DOCKER_HOST_NAME_OR_IP := docker.for.mac.localhost
else ifeq ($(PLATFORM),Linux)
export DOCKER_HOST_NAME_OR_IP := $(shell ip -f inet addr show docker0 | grep -Po 'inet \K[\d.]+')
endif

ENV ?= dev
PROJECT_DIR=$(shell pwd)

ENV ?= dev
ENV_DIR=${PROJECT_DIR}/env/${ENV}
DEPLOY_DIR=${PROJECT_DIR}/deploy

DIST_BUILD_DIR=docker/service/app/dist/build
TMP_DIST_BUILD_DIR=$(DIST_BUILD_DIR)-tmp
export DOCKER_DEPLOY_TAG=$(shell ${DEPLOY_DIR}/bin/generate-deploy-tag)

DOCKER_COMPOSE_FILES=environment/$(ENV)/docker-compose.yml
DOCKER_COMPOSE=docker-compose -f $(DOCKER_COMPOSE_FILES)

.PHONY: help
help:
	@echo "run make up to start the project"

.PHONY: all
all: docker-base-images docker-dist-image system-test

.PHONY: up
up: docker-base-images
	$(DOCKER_COMPOSE) up

.PHONY: down
down:
	$(DOCKER_COMPOSE) down

.PHONY: docker-base-images
docker-base-images:
	docker build -t allihoppa/mysql:5.7 docker/service/mysql
	docker build -t allihoppa/allihoppa.nl:base docker/service/app/base
	docker build -t allihoppa/allihoppa.nl:dev docker/service/app/dev
	docker build -t allihoppa/allihoppa.nl:js-build docker/js-build

.PHONY: docker-dist-image
docker-dist-image: docker-base-images
	rm -rf ${TMP_DIST_BUILD_DIR}
	mkdir -p ${TMP_DIST_BUILD_DIR}
	cp -R \
		bin \
		bower.json \
		composer.json \
		composer.lock \
		configFromEnv.php \
		gulpfile.js \
		package.json \
		public \
		vendor \
		${TMP_DIST_BUILD_DIR}/

	# Create composer, bower and npm cache dirs
	mkdir -p \
		~/.composer \
		~/.cache/bower \
		~/.config/configstore/bower \
		~/.local/bower \
		~/.npm

	docker-compose \
		-f environment/dev/docker-compose.yml \
		run --rm \
		--workdir=/var/www/$(TMP_DIST_BUILD_DIR) \
		app \
			composer install \
			--prefer-dist \
			--ansi \
			--no-dev \
			--no-suggest \
			--optimize-autoloader \

	docker-compose \
		-f environment/dev/docker-compose.yml \
		run --rm \
		--workdir=/workspace/$(TMP_DIST_BUILD_DIR) \
		js-build \
			sh -c "npm install --no-optional --silent && gulp"

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
		${TMP_DIST_BUILD_DIR}/public \
		${DIST_BUILD_DIR}

	cp -r ${TMP_DIST_BUILD_DIR}/bin ${TMP_DIST_BUILD_DIR}/configFromEnv.php ${DIST_BUILD_DIR}/

	docker build \
		docker/service/app/dist \
		-t allihoppa/allihoppa.nl:${DOCKER_DEPLOY_TAG} \
		-t allihoppa/allihoppa.nl:latest

.PHONY: system-test
system-test: ENV=ci
system-test: DOCKER_COMPOSE_FILES+=-f environment/ci/docker-compose-debug.yml
system-test: docker-dist-image
	$(DOCKER_COMPOSE) down
	$(DOCKER_COMPOSE) up  -d

	./composer install

	docker-compose \
		-f environment/$(ENV)/docker-compose.yml \
		run --rm behat sh -c ' \
			timeout -t 60 tests/system/wait-until-website-becomes-available 'http://app:8000/admin' && \
			timeout -t 120 vendor/bin/behat \
		' || \
	($(DOCKER_COMPOSE) logs && exit 1)

	[[ -z "${ERROR_LOGS}" ]] || (echo "There were errors:\n" && echo ${ERROR_LOGS} && exit 1)
	$(DOCKER_COMPOSE) logs app > environment/ci/app.log
	@grep -i 'error' environment/ci/app.log && ( \
		echo "Test completed succesfully but the application log contains errors:" && \
		cat environment/ci/app.log | grep --color -E 'error|$$' \
		&& exit 1 \
	)

.PHONY: docker-images-persistent
docker-images-persistent:
	docker push allihoppa/mysql:5.7
	docker push allihoppa/allihoppa.nl:dev
	docker push allihoppa/allihoppa.nl:latest
	docker push allihoppa/allihoppa.nl:${DOCKER_DEPLOY_TAG}



.PHONY: entrypoint-docker-compose
entrypoint-docker-compose:
	$(DOCKER_COMPOSE) $(ARGS)

.PHONY: entrypoint-composer
entrypoint-composer:
	$(DOCKER_COMPOSE) run --rm --no-deps app \
		composer -vvv --ansi $(ARGS)
