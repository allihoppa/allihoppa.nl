#!/bin/bash

# This script is a workaround to support debugging using X windows
# Once https://github.com/SeleniumHQ/docker-selenium/pull/346 has been
# resolved it can be removed again

source /opt/bin/functions.sh

export GEOMETRY="$SCREEN_WIDTH""x""$SCREEN_HEIGHT""x""$SCREEN_DEPTH"

function shutdown {
  kill -s SIGTERM $NODE_PID
  wait $NODE_PID
}

if [ ! -z "$SE_OPTS" ]; then
  echo "appending selenium options: ${SE_OPTS}"
fi

SERVERNUM=$(get_server_num)

rm -f /tmp/.X*lock

java ${JAVA_OPTS} -jar /opt/selenium/selenium-server-standalone.jar \
${SE_OPTS} &

NODE_PID=$!

trap shutdown SIGTERM SIGINT
wait $NODE_PID
