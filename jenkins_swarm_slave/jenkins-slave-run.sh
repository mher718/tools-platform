#!/bin/bash

set -x

HOST_IP=$(ip route | grep ^default | awk '{print $3}')
JENKINS_SERVER=${JENKINS_SERVER:-$HOST_IP}
JENKINS_PORT=${JENKINS_PORT:-8080}
JENKINS_LABELS=${JENKINS_LABELS:-swarm}
JENKINS_HOME=${JENKINS_HOME:-$HOME}
JENKINS_USERNAME=${JENKINS_USERNAME:-user}
JENKINS_PASSWORD=${JENKINS_PASSWORD:-password}
JENKINS_EXECUTORS=${JENKINS_EXECUTORS:-4}

# start the docker daemon
/usr/local/bin/wrapdocker &

# start swarm slave
java -jar /home/jenkins/swarm-client-1.24-jar-with-dependencies.jar -username $JENKINS_USERNAME -password $JENKINS_PASSWORD -fsroot "$JENKINS_HOME" -labels "$JENKINS_LABELS" -master $JENKINS_SERVER:$JENKINS_PORT -executors $JENKINS_EXECUTORS $@
