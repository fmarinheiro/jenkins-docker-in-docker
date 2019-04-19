#! /bin/bash

NEW_GROUP_FOR_DOCKER=docker_alt
JENKINS_USER=jenkins

DOCKER_SOCK_GROUP=$(ls -l /var/run/docker.sock  | awk '{print $4}')

sudo sh -c "getent group $DOCKER_SOCK_GROUP || groupadd -g $DOCKER_SOCK_GROUP $NEW_GROUP_FOR_DOCKER"

sudo usermod -aG $NEW_GROUP_FOR_DOCKER $JENKINS_USER
