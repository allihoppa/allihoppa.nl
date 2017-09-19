#!/usr/bin/env bash

set -e

SWARM_HOST=lucasvanlierop-website
DOCKER_COMPOSE_FILE_PROD=environment/prod/docker-compose.yml
export ALLIHOPPA_UID=1001
export ALLIHOPPA_GID=1001

deploy_stack() {
    local stack_name=$1
    local stack_file=$2

    eval $(docker-machine env ${SWARM_HOST})

    docker \
		stack deploy \
		-c ${stack_file} \
		${stack_name}

    eval $(docker-machine env --unset)
}

deploy_stack allihoppa ${DOCKER_COMPOSE_FILE_PROD}
